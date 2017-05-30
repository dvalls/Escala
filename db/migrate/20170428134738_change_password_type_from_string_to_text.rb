class ChangePasswordTypeFromStringToText < ActiveRecord::Migration[5.0]
  def up
    change_column :students, :password_digest, :text, :limit => nil
    change_column :students, :username, :text, :limit => nil
  end

  def down
    change_column :studetns, :username, :string
    change_column :students, :password_digest, :string
  end
end
