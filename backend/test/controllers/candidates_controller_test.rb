require "test_helper"

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get candidates_url, as: :json
    assert_response :success
  end

  test "should create candidate" do
    assert_difference("Candidate.count") do
      post candidates_url, params: { candidate: { name: @candidate.name, party_id: @candidate.party_id, position_id: @candidate.position_id } }, as: :json
    end

    assert_response :created
  end

  test "should show candidate" do
    get candidate_url(@candidate), as: :json
    assert_response :success
  end

  test "should update candidate" do
    patch candidate_url(@candidate), params: { candidate: { name: @candidate.name, party_id: @candidate.party_id, position_id: @candidate.position_id } }, as: :json
    assert_response :success
  end

  test "should destroy candidate" do
    assert_difference("Candidate.count", -1) do
      delete candidate_url(@candidate), as: :json
    end

    assert_response :no_content
  end
end
