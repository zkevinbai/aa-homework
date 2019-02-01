# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    before_validation :ensure_session_token
    validates :email, :password_digest, :session_token, presence: true
    validates :email, uniqueness: true
    validates :password, length: {minimum: 3, allow_nil: true}

    # Session Related Methods
    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end 

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end 

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    # Password Related Methods
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def password
        @password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    # User interaction methods

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        if user && user.is_password?(password)
            user
        else 
            nil
        end
    end
end
