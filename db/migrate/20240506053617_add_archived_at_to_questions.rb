class AddArchivedAtToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :archived_at, :datetime
  end
end
