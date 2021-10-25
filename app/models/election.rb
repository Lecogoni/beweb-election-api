class Election < ApplicationRecord
    has_many :candidates, dependent: :destroy
    has_many :voters, dependent: :destroy
    belongs_to :user
end
