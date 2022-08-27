class Contest < ApplicationRecord
  scope :verified, -> { where(verified: true) }
  scope :sorted, -> { all.sort_by { |c| c.verified ? 0 : 1 }.reverse }

  def self.search(query = nil)
    return [Contest.verified.all.sort_by(&:created_at).last] if query == 'latest'
    return Contest.verified.where("lower(name) like ?", "%#{query.downcase}%") if query
    Contest.verified
  end
end
