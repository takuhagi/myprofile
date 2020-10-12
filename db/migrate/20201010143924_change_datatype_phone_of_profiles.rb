class ChangeDatatypePhoneOfProfiles < ActiveRecord::Migration[6.0]
  def change
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :profiles, :phone, :string
  end
end
