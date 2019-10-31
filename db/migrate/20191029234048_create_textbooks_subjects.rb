class CreateTextbooksSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :textbooks_subjects do |t|
      t.references :subject, foreign_key: true
      t.references :textbook, foreign_key: true

      t.timestamps
    end
  end
end
