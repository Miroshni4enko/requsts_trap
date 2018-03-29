class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :url
      t.json :request_data

      t.timestamps
    end
  end
end
