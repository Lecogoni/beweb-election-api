class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, presence:true
      t.string :last_name, presence:true

      t.timestamps
    end
  end
end
