class ChangeStudents < ActiveRecord::Migration[5.0]
  def up
    change_column :students, :password_digest, :string
  end

  def down
    change_column :students, :password_digest, :string, :limit => 25

  end
end
