require "test_helper"

class WardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ward = wards(:one)
  end

  test "should get index" do
    get wards_url, as: :json
    assert_response :success
  end

  test "should create ward" do
    assert_difference("Ward.count") do
      post wards_url, params: { ward: { name: @ward.name, subcounty_id: @ward.subcounty_id } }, as: :json
    end

    assert_response :created
  end

  test "should show ward" do
    get ward_url(@ward), as: :json
    assert_response :success
  end

  test "should update ward" do
    patch ward_url(@ward), params: { ward: { name: @ward.name, subcounty_id: @ward.subcounty_id } }, as: :json
    assert_response :success
  end

  test "should destroy ward" do
    assert_difference("Ward.count", -1) do
      delete ward_url(@ward), as: :json
    end

    assert_response :no_content
  end
end
