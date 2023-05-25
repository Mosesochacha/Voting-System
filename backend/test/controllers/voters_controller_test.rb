require "test_helper"

class VotersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voter = voters(:one)
  end

  test "should get index" do
    get voters_url, as: :json
    assert_response :success
  end

  test "should create voter" do
    assert_difference("Voter.count") do
      post voters_url, params: { voter: { id_number: @voter.id_number, name: @voter.name, ward_id: @voter.ward_id } }, as: :json
    end

    assert_response :created
  end

  test "should show voter" do
    get voter_url(@voter), as: :json
    assert_response :success
  end

  test "should update voter" do
    patch voter_url(@voter), params: { voter: { id_number: @voter.id_number, name: @voter.name, ward_id: @voter.ward_id } }, as: :json
    assert_response :success
  end

  test "should destroy voter" do
    assert_difference("Voter.count", -1) do
      delete voter_url(@voter), as: :json
    end

    assert_response :no_content
  end
end
