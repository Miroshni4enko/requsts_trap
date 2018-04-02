class AddAmountToTrapUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :trap_urls, :amount, :integer
  end
end
