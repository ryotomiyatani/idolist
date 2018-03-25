class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :user
      t.string :email
      t.string :content

      t.timestamps
    end
  end
end
