class AddUsernameToGeneralUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :general_users, :username, :string
  end
end
