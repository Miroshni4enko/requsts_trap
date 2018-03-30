class ChangeTrapUrlsUrlAddIndexToUrl < ActiveRecord::Migration[5.1]
  def change
    change_column :trap_urls, :url, :string,  null: false
    add_index :trap_urls, :url, unique: true
  end
end
