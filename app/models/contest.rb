class Contest < ApplicationRecord
  scope :verified, -> { where(verified: true) }
  scope :sorted, -> { all.sort_by { |c| c.verified ? 0 : 1 }.reverse! }
  scope :most_popular, -> { all.sort_by { |c| c.count }.reverse!.first }
  scope :latest, -> { all.sort_by { |c| c.created_at }.reverse!.first }

  def self.search(query = nil)
    return [Contest.verified.latest] if query == 'latest'
    return [Contest.verified.most_popular] if query == 'most_popular'
    return Contest.verified.where("lower(name) like ?", "%#{query.downcase}%") if query
    Contest.verified
  end

  def do_registration
    self.count += 1
    save
  end
end
