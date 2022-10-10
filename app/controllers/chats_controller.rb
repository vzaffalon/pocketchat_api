class ChatsController < ApplicationController

    def index
        render json: Chat.all
    end

    def create
        chat = Chat.create(chats_params)
        if chat.save
            render json: chat, status: :ok
        else
            render json: chat.errors, status: :unprocessable_entity
        end
    end

    private
    def chats_params
        params.permit(:user_id)
    end
end
