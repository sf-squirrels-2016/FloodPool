require 'faker'

User.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :name => Faker::Name.first_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

questions = 10.times.map do
  Question.create!( :text => Faker::Lorem.sentence,
                    :user_id => rand(1..10))

end

answers = 10.times.map do
  Answer.create!( :user_id => rand(1..10),
                  :question_id => rand(1..10),
                  :text => Faker::Lorem.paragraph,
                  :bestest => false)
end

comments = 20.times.map do
  Comment.create!( :user_id => rand(1..10),
                   :troll_id => rand(1..10),
                   :troll_type => [answer, question].sample,
                   :text => Faker::Lorem.sentence)
end

votes = 100.times.map do
  Vote.create!( :user_id => rand(1..10),
                :voting_on_id => rand(1..10),
                :voting_on_type => [answer, question, comment].sample,
                :vote_value => [1, -1].sample)
end
