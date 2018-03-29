class TrapUrl < ApplicationRecord
  has_many :requests, dependent: :destroy
end
