class AddIdolNamekanaToIdol < ActiveRecord::Migration[5.0]
  def change
    add_column :idols, :idol_namekana, :string
  end
end
