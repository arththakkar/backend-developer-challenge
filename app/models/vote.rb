class Vote < ApplicationRecord
  # Associations
  belongs_to :user

  def is_valid?(candidate_type)
    if self.candidate_type == candidate_type
      return "User has already voted for this candidate"
    else
      return true
    end
  end

  def allowed_to_vote?
    if Time.now <= self.user.created_at + 24.hours
      return true
    else
      return "User is not allowed to vote"
    end
  end
end
