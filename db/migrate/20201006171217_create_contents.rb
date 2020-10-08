class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      # null: false をどうするか
      t.text :text
      t.string :image
      t.references :profile, foreign_key: true
      t.timestamps
    end
  end
end
