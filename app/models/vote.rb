class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :voting_on, polymorphic: true


end
