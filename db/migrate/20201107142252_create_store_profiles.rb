class CreateStoreProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :store_profiles do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :explanation
      
      # 一応つけておきます
      t.string :profile_link

      t.string :item_link
      t.string :service_link
      t.string :event_link
      t.timestamps
    end
  end
end
