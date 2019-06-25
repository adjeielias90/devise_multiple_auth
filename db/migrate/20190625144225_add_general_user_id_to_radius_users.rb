class AddGeneralUserIdToRadiusUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :radius_users, :general_user_id, :bigint
    add_index :radius_users, :general_user_id, unique: true
  end
end
