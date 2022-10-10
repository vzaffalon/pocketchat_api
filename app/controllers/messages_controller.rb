class MessagesController < ApplicationController

    def index
        render json: Message.all
    end

    def create
        message = Message.new(message_params)
        if message.save
            render json: message, status: :ok
        else
            render json: message.errors, status: :unprocessable_entity
        end
    end

    private
    def message_params
        params.permit(:body, :chat_id)
    end
end
