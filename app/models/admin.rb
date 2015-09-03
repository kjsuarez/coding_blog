class Admin < ActiveRecord::Base
	has_many :posts

	validates :name, presence: true, length: {maximum: 25}, uniqueness: true
	validates :password, length: {minimum: 6}, presence: true

	has_secure_password 
end
