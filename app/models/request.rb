class Request < ApplicationRecord
  belongs_to :trap_url, foreign_key: 'url'
end
