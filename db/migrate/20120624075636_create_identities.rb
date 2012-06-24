class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid, :null => false
      t.string :provider, :null => false, :limit => 10
      t.references :user
    end
    add_index :identities, [:provider, :uid]
    add_index :identities, :user_id
  end
end
