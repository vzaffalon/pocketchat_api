require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should create a message" do
    user = User.create(:first_name => "victor")
    chat = Chat.create(:user_id => user.id)
    post "/messages", params: { body: "message", chat_id: chat.id }, xhr: true
    responseJson = JSON.parse(@response.body)
  
    assert_equal "message", responseJson['body']
    assert_not_nil responseJson['id']
    assert_equal 200, @response.status
  end

  test "should not create a message when missing body" do
    user = User.create(:first_name => "victor")
    chat = Chat.create(:user_id => user.id)
    post "/messages", params: { body: nil, chat_id: chat.id }, xhr: true
    responseJson = JSON.parse(@response.body)
  
    assert_equal ["can't be blank"], responseJson['body']
    assert_equal 422, @response.status
  end
end
