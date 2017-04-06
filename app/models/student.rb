class Student < ActiveRecord::Base

  has_secure_password

  validates :username, :password, :name, :last_name, :email, presence: true

  has_and_belongs_to_many :courses


  def full_name
    " #{name} #{last_name}"
  end

end
