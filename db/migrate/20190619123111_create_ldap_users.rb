class CreateLdapUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :ldap_users do |t|
      t.belongs_to :general_user, foreign_key: true

      t.timestamps
    end
  end
end
