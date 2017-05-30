class Student < ActiveRecord::Base

  has_secure_password

  validates  :password, presence: true, on: :create
  validates  :name, :last_name, :email, presence: true
  validates_uniqueness_of :email

  has_and_belongs_to_many :courses

  def full_name
    " #{name} #{last_name}"
  end

end
