class Customer < ActiveRecord::Base

	before_save {self.email = email.downcase}

	validates :name, presence: true, length: { maximum: 50, minimum: 3}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255},
							format: { with: VALID_EMAIL_REGEX },
							uniqueness: { case_sensitive: false }
	validates :mobile, presence: true, length: {maximum: 10, minumum: 10}

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

end
