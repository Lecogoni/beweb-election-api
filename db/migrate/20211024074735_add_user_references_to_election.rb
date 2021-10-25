class AddUserReferencesToElection < ActiveRecord::Migration[6.1]
  def change
    add_reference :elections, :user, null: false, foreign_key: true
  end
end
