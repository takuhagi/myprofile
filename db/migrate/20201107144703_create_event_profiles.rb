class CreateEventProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :event_profiles do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :explanation
      t.string :prefecture
      t.string :city
      t.string :prace

      # 開催時期
      t.datetime :start
      t.datetime :end

      # 一応つけておきます
      t.string :profile_link
      
      t.string :store_link
      t.string :item_link
      t.string :service_link
      t.timestamps
    end
  end
end
