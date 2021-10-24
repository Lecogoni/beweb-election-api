class CreateElections < ActiveRecord::Migration[6.1]
  def change
    create_table :elections do |t|
      t.string :title, presence:true
      t.text :description
      t.boolean :started, :default  => false

      t.timestamps
    end
  end
end
