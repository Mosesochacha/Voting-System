require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get votes_url, as: :json
    assert_response :success
  end

  test "should create vote" do
    assert_difference("Vote.count") do
      post votes_url, params: { vote: { candidate_id: @vote.candidate_id, position_id: @vote.position_id, voter_id: @vote.voter_id, votes: @vote.votes, voting_end_date: @vote.voting_end_date, voting_start_date: @vote.voting_start_date } }, as: :json
    end

    assert_response :created
  end

  test "should show vote" do
    get vote_url(@vote), as: :json
    assert_response :success
  end

  test "should update vote" do
    patch vote_url(@vote), params: { vote: { candidate_id: @vote.candidate_id, position_id: @vote.position_id, voter_id: @vote.voter_id, votes: @vote.votes, voting_end_date: @vote.voting_end_date, voting_start_date: @vote.voting_start_date } }, as: :json
    assert_response :success
  end

  test "should destroy vote" do
    assert_difference("Vote.count", -1) do
      delete vote_url(@vote), as: :json
    end

    assert_response :no_content
  end
end
