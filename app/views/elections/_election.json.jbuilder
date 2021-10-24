json.extract! election, :id, :title, :description, :started, :created_at, :updated_at
json.url election_url(election, format: :json)
