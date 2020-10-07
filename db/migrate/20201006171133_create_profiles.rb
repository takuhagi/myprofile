class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :first_name_kana, null: false
      t.string :family_name_kana, null: false
      t.string :city, null: false
      t.integer :post_code, null: false, null: false
      t.string :address_number, null: false
      t.string :building, null: false
      t.references :user, foreign_key: true
      t.integer :prefecture_id,foreign_key: true
      t.string :primary_school
      t.string :Junior_high_school
      t.string :high_school
      t.string :vocational_school 
      t.string :university
      t.string :graduate_school
      t.string :other_school

      # 職歴の数を指定しない場合、careerテーブル作成　１体多
      t.string :first_career
      t.string :second_career
      t.string :third_career
      t.string :fourth_career
      t.string :last_career

      t.text :introduction
      t.date :birth_date, null: false
      t.string :avatar
      t.integer :phone
      t.string :image
      t.string :hp
      t.string :facebook
      t.string :twitter

      # ジャンルが複数なら不要
      # t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
