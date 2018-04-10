class TrapUrl < ApplicationRecord
  self.primary_key = :url
  has_many :requests, dependent: :destroy, foreign_key: 'url'

  def self.create_if_not_exist(attrs = {})
    TrapUrl.transaction(requires_new: true) do
      return TrapUrl.find_or_create_by(attrs)
    end
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end
