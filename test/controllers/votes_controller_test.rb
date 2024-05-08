require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "should cast vote" do
    user = users(:arth)
    patch votes_cast_vote_url, params: { candidate_type: "B", authentication_token: user.authentication_token }
    assert_response :success
    assert_equal 'B', json_response['vote']['candidate_type']
  end

  test "should not cast vote if already voted" do
    user = users(:arth)
    patch votes_cast_vote_url, params: { candidate_type: "A", authentication_token: user.authentication_token }
    assert_response :unauthorized
    assert_includes json_response['errors'], 'User has already voted for this candidate'
  end

  test "should not cast vote if not allowed" do
    vote = votes(:jons_vote)
    user = vote.user
    patch votes_cast_vote_url, params: { candidate_type: "B", authentication_token: user.authentication_token }
    assert_response :unauthorized
    assert_includes json_response['errors'], 'User has already voted for this candidate'
  end

  test "should get results" do
    jon_vote = votes(:jons_vote)
    arth_vote = votes(:arths_vote)
    get votes_results_url
    assert_response :success
    assert_equal 1, json_response['results']['A']
    assert_equal 1, json_response['results']['B']
  end

  private

  # Helper method to parse JSON responses
  def json_response
    JSON.parse(response.body)
  end
end
