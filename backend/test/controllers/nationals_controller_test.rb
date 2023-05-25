require "test_helper"

class NationalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @national = nationals(:one)
  end

  test "should get index" do
    get nationals_url, as: :json
    assert_response :success
  end

  test "should create national" do
    assert_difference("National.count") do
      post nationals_url, params: { national: { name: @national.name } }, as: :json
    end

    assert_response :created
  end

  test "should show national" do
    get national_url(@national), as: :json
    assert_response :success
  end

  test "should update national" do
    patch national_url(@national), params: { national: { name: @national.name } }, as: :json
    assert_response :success
  end

  test "should destroy national" do
    assert_difference("National.count", -1) do
      delete national_url(@national), as: :json
    end

    assert_response :no_content
  end
end
