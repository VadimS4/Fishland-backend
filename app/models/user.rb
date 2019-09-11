class User < ApplicationRecord
    has_many :favorites
    has_many :fish, through: :favorites

    has_secure_password

    # Make sure that there is a name.
    validates :name, presence: true, length: { maximum: 100 }
    # Make sure that the username is unique
    validates :username, uniqueness: { case_sensitive: false }
    # Make sure that there is a password and that the password is a minimum 6 characters
    validates :password, presence: true, length: { minimum: 6}
end
