class RenameUrlToTrapUrl < ActiveRecord::Migration[5.1]
  def change
    rename_table :urls, :trap_urls
  end
end
