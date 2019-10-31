class CreateTextbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :textbooks do |t|
      t.string :name
      t.date :release_date
      t.string :author
      t.integer :ISBN
      t.string :condition
      t.integer :price
      t.integer :retail_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
