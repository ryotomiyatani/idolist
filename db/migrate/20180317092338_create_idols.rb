class CreateIdols < ActiveRecord::Migration[5.0]
  def change
    create_table :idols do |t|
      t.string :idol_name
      t.string :idol_content
      t.string :idol_url
      t.string :idol_image

      t.timestamps
    end
  end
end
