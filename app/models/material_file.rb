class MaterialFile < ActiveRecord::Base

  belongs_to :my_course
  has_and_belongs_to_many :categories
end
