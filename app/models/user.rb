class User < ApplicationRecord
    has_many :chats
    validates :first_name, presence: true
end
