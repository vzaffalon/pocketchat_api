class MessagesController < ApplicationController

    def index
        render json: Message.all
    end

    def create
        message = Message.new(message_params)
    end

    private
    def message_params
        params.permit(:body, :chat_id)
    end
end
