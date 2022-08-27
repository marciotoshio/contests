class Contest < ApplicationRecord
  scope :verified, -> { where(verified: true) }
end
