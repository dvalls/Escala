class RemoveTableMembers < ActiveRecord::Migration[5.0]
  def up
    drop_table :members
  end

  def down
    create_table :members do |t|
      t.timestamps
    end
  end
end
