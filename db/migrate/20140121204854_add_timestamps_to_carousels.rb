class AddTimestampsToCarousels < ActiveRecord::Migration
  def change
    add_column(:carousels, :order, :integer)
  end
end
