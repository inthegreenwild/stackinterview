class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :answer
      t.integer :rating
      t.string :category

      t.timestamps null: false
    end
  end
end
