require "test_helper"

class ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should create a chat" do
    user = User.create(:first_name => "victor")
    post "/chats", params: { user_id: user.id }, xhr: true
    responseJson = JSON.parse(@response.body)
  
    assert_equal user.id, responseJson['user_id']
    assert_not_nil responseJson['id']
    assert_equal 200, @response.status
  end

  test "should not create a chat when field is missing" do
    user = User.create(:first_name => "victor")
    post "/chats", params: { user_id: nil }, xhr: true
    responseJson = JSON.parse(@response.body)
  
    assert_equal ["can't be blank"], responseJson['user_id']
    assert_equal 422, @response.status
  end


end
