class RemoveParamsStudents < ActiveRecord::Migration[5.0]
  def up
    remove_column :students, :birthday
    remove_column :students, :gender
    remove_column :students, :degree
    remove_column :students, :address
    remove_column :students, :address_number
  end

  def down
    add_column :students, :address_number
    add_column :students, :address
    add_column :students, :degree
    add_column :students, :gender
    add_column :students, :birthday
  end
end
