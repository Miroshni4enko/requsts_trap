class TrapUrl < ApplicationRecord
  self.primary_key = :url
  has_many :requests, dependent: :destroy
end
