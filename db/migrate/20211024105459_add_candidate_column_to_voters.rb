class AddCandidateColumnToVoters < ActiveRecord::Migration[6.1]
  def change
    add_column :voters, :candidate_id, :integer
  end
end
