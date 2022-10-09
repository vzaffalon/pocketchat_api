class Chat < ApplicationRecord
    belongs_to :user
    validate :user
end
