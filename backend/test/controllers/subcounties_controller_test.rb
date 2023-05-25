require "test_helper"

class SubcountiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subcounty = subcounties(:one)
  end

  test "should get index" do
    get subcounties_url, as: :json
    assert_response :success
  end

  test "should create subcounty" do
    assert_difference("Subcounty.count") do
      post subcounties_url, params: { subcounty: { county_id: @subcounty.county_id, name: @subcounty.name } }, as: :json
    end

    assert_response :created
  end

  test "should show subcounty" do
    get subcounty_url(@subcounty), as: :json
    assert_response :success
  end

  test "should update subcounty" do
    patch subcounty_url(@subcounty), params: { subcounty: { county_id: @subcounty.county_id, name: @subcounty.name } }, as: :json
    assert_response :success
  end

  test "should destroy subcounty" do
    assert_difference("Subcounty.count", -1) do
      delete subcounty_url(@subcounty), as: :json
    end

    assert_response :no_content
  end
end
