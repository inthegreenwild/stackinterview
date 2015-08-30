class AddKeywordToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :keyword, :string
  end
end
