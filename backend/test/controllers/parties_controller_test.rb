require "test_helper"

class PartiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party = parties(:one)
  end

  test "should get index" do
    get parties_url, as: :json
    assert_response :success
  end

  test "should create party" do
    assert_difference("Party.count") do
      post parties_url, params: { party: { name: @party.name } }, as: :json
    end

    assert_response :created
  end

  test "should show party" do
    get party_url(@party), as: :json
    assert_response :success
  end

  test "should update party" do
    patch party_url(@party), params: { party: { name: @party.name } }, as: :json
    assert_response :success
  end

  test "should destroy party" do
    assert_difference("Party.count", -1) do
      delete party_url(@party), as: :json
    end

    assert_response :no_content
  end
end
