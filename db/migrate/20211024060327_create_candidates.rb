class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.references :election, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :slogan
      t.text :program

      t.timestamps
    end
  end
end
