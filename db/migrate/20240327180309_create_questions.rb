class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
