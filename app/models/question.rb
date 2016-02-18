class Question < ActiveRecord::Base
  belongs_to :user

  has_many :answers
  has_many :comments, as: :troll
  has_many :votes, as: :voting_on

end
