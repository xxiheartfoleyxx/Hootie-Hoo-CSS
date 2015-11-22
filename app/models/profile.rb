class Profile < ActiveRecord::Base
  belongs_to :users
  validates_associated :user
end
