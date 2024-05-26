class Question < ApplicationRecord
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates :body, presence: true

  def self.all_current
    Question.all.select {|elem| elem.archived_at.nil?}
  end
end
