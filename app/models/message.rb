class Message < ApplicationRecord
    belongs_to :chat
    validates :chat_id, presence: true
    validates :body, presence: true
end
