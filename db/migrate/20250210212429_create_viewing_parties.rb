class CreateViewingParties < ActiveRecord::Migration[7.1]
  def change
    create_table :viewing_parties do |t|
      t.string :name, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :movie_id, null: false
      t.string :movie_title, null: false
      t.integer :host_id
      t.references :user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
