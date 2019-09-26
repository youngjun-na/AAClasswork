require 'test_helper'

class ArtworkSharesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get artwork_shares_create_url
    assert_response :success
  end

  test "should get destroy" do
    get artwork_shares_destroy_url
    assert_response :success
  end

end
