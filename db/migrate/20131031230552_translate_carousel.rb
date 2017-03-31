class TranslateCarousel < ActiveRecord::Migration
  def self.up
    Carousel.create_translation_table!({
                                       :title => :string,
                                       :description => :string
                                   }, {
                                       :migrate_data => true
                                   })
  end

  def self.down
    Carousel.drop_translation_table! :migrate_data => true
  end
end
