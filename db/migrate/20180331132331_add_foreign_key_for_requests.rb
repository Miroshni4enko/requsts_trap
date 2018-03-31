class AddForeignKeyForRequests < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :requests, :trap_urls, column: :url, primary_key: :url
  end
end
