class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      # user_idをnull:falseにするかどうか
      t.references :user, foreign_key: true
      t.integer :followed_id, null: false
      t.timestamps
    end
  end
end
