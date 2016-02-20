class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  has_many :comments, as: :troll
  has_many :votes, as: :voting_on

  include Count
end
