class ChangePasswordTypeFromStringToText < ActiveRecord::Migration[5.0]
  def up
    change_column :students, :password_digest, :text, :limit => nil
  end

  def down
    change_column :students, :password_digest, :string
  end
end
