class CreateThoughts < ActiveRecord::Migration[5.0]
  def change
    create_table :thoughts do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :idol, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :idol_id, :type], unique: true
      
    end
  end
end
