class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :trap_urls, id: false, primary_key: :url do |t|
      t.string :url
      t.timestamps
    end
  end
end
