require 'test_helper'

class WelcomespControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcomesp_index_url
    assert_response :success
  end

end
