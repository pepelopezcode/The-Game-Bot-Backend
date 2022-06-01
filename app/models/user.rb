class User < ApplicationRecord
    has_many :wordle_scores
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
end
