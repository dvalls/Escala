class CreateUser < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :admin, :default => false
    end
  end

  def down
    drop_table :users
  end
end
