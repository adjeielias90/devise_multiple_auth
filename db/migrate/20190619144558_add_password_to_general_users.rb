class AddPasswordToGeneralUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :general_users, :password_digest, :string
  end
end
