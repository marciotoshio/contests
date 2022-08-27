class Contest < ApplicationRecord
  scope :verified, -> { where(verified: true) }
  scope :sorted, -> { all.sort_by { |c| c.verified ? 0 : 1 }.reverse }
end
