class Voter < ApplicationRecord
  belongs_to :election
  belongs_to :user

  def num_of_vote_current_user(election, vote)
    num = Voter.where(election_id: election.id, user_id: vote.user_id ).count
  end

end
