class CreateContentLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :content_links do |t|

      t.timestamps
    end
  end
end
