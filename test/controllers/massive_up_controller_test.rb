require 'test_helper'

class MassiveUpControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get massive_up_new_url
    assert_response :success
  end

  test "should get create" do
    get massive_up_create_url
    assert_response :success
  end

end
