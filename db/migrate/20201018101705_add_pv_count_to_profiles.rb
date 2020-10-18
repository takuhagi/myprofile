class AddPvCountToProfiles < ActiveRecord::Migration[6.0]
  def change
    # null:falseで初期値0
    add_column :profiles, :pv_count, :integer, null: false
  end
end
