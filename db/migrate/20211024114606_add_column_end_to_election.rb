class AddColumnEndToElection < ActiveRecord::Migration[6.1]
  def change
    add_column :elections, :end, :boolean, :default  => false
  end
end
