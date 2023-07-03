class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_digest
      t.boolean :email_confirmed, default: false, null: false

      t.timestamps
    end
  end
end