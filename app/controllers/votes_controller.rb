class VotesController < ApplicationController
  skip_before_action :authenticate_user, only: %i[results]

  before_action :validate_candidate_type, only: %i[cast_vote]

  def cast_vote
    vote = Vote.find_or_initialize_by(user_id: @current_user.id)
    allowed_to_vote = vote.allowed_to_vote?
    valid_vote = vote.is_valid?(params[:candidate_type])
    
    if !allowed_to_vote.is_a?(String) && !valid_vote.is_a?(String)
      vote.candidate_type = params[:candidate_type]
      vote.save
      render json: { vote: vote }, status: 200
    else
      errors = allowed_to_vote.is_a?(String) ? allowed_to_vote : valid_vote
      render json: { errors: errors }, status: 401
    end
  end

  def results
    vote_by_candidate = Vote.group(:candidate_type).count
    render json: { results: vote_by_candidate }, status: 200
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :candidate_type)
  end

  def validate_candidate_type
    unless ["A", "B"].include?(params[:candidate_type])
      render json: { errors: 'Invalid candidate type' }, status: 401
    end
  end
end
