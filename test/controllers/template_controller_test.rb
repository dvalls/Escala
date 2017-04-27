require 'test_helper'

class TemplateControllerTest < ActionDispatch::IntegrationTest
  test "should get body" do
    get template_body_url
    assert_response :success
  end

  test "should get grid" do
    get template_grid_url
    assert_response :success
  end

end
