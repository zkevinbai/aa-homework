# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class User < ApplicationRecord
    attr_accessor :password

    before_validation :ensure_session_token

    validates :username, :session_token, presence: true
    validates :password_digest, length: {minimum:6, allow_nil: true}
    validate :password_digest_not_null
    
    def password_digest_not_null
        if password_digest == nil
            errors[:password_digest] << "Password can't be blank"
        end
    end
    
    def self.find_by_credentials(username, password)
        # This method takes in a username and a password and returns the user that matches
        User.where(username: username).where(password: password)
    end
    
    def self.generate_session_token
        # This is a helper method I like to write that uses SecureRandom::urlsafe_base64 and returns a 16-digit pseudorandom string
        SecureRandom::urlsafe_base64(16)
    end
    
    def self.reset_session_token!
        # This method resets the user's session_token and saves the user
        session_token = nil
        user.save
    end
    
    def self.ensure_session_token
        # This method makes sure that the user has a session_token set, setting one if none exists
        session_token ||= User.generate_session_token
    end
    
    def self.password=(arg)
        # This method sets @password equal to the argument given so that the appropriate validation can happen
        # This method also encrypts the argument given and saves it as this user's password_digest
        password_digest = arg.hash
        @password = arg
    end
    
end

# Remember: you have to add an attr_reader for password for the validation to occur!
