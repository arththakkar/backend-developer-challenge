class User < ApplicationRecord
	has_secure_password
	# Associations
	has_one :vote

	# Validations
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, confirmation: true

	def generate_token
		self.authentication_token = SecureRandom.urlsafe_base64
		self.save
	end
end
