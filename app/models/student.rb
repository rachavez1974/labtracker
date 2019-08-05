class Student < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password
  validates_presence_of :user_name, :class_year
end
