json.extract! candidate, :id, :election_id, :user_id, :slogan, :program, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
