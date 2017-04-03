class About < ActiveRecord::Base

  # translates :body

  has_many :images, :as => :imageable, :dependent => :destroy

end
