class Question < ApplicationRecord
  belongs_to :user

  def self.all_current
    Question.all.select {|elem| elem.archived_at.nil?}
  end
end
