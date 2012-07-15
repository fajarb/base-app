class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.datetime :created_at, :null => false
    end
  end
end
