class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.text :text, null: false
      t.boolean :bestest

      t.timestamps
    end
  end
end
