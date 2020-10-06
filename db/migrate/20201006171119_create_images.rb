class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true
      # null: falseをどうするか
      t.string :src
      t.string :title
      t.text :caption
      t.timestamps
    end
  end
end
