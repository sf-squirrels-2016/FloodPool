class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :troll, polymorphic: true

  has_many :votes, as: :voting_on

end
