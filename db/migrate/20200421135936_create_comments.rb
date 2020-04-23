class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :image
      t.references :user, foreign_key: true, type: :integer
      t.references :post, foreign_key: true, type: :integer
      t.timestamps
    end
  end
end
