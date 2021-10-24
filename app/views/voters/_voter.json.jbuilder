json.extract! voter, :id, :election_id, :user_id, :created_at, :updated_at
json.url voter_url(voter, format: :json)
