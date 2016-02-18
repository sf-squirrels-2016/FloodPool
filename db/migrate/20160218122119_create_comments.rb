class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.integer :troll_id
      t.string :troll_type
      t.text :text

      t.timestamps
    end
  end
end
