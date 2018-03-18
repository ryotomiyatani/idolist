class RenameNameIdColumnToAdministrators < ActiveRecord::Migration[5.0]
  def change
    rename_column :administrators, :name_id, :name
  end
end
