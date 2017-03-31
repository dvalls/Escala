class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string "username",        limit: 25
      t.string "password_digest", limit: 25
      t.string "name"
      t.string "last_name"
      t.string "gender"
      t.date   "birthday"
      t.string "degree"
      t.string "email"
      t.string "address"
      t.string "address_number"

    end
  end

  def down
    drop_table :students
  end

end
