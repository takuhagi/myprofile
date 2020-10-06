class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
     # null: false追加
     t.string :tag_name, null: false
      t.timestamps
    end
  end
end
