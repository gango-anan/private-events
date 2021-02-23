class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name, null: false
      t.text :description, null: false
      t.string :event_venue, null: false
      t.datetime :event_date, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
    add_index :events, :event_name, unique: true
    add_foreign_key :events, :users, column: :user_id
  end
end
