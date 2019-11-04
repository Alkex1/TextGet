class AddDescriptionToTextbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :textbooks, :description, :text
  end
end
