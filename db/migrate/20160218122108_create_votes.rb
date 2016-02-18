class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.string :voting_on_type
      t.integer :voting_on_id
      t.integer :vote_value

      t.timestamps
    end
  end
end
