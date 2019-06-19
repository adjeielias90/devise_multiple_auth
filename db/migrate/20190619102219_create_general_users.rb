class CreateGeneralUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :general_users do |t|
      t.string :email
      t.belongs_to :provider, foreign_key: true

      t.timestamps
    end
  end
end
