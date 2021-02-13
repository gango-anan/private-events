class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.bigint :user_id
      t.bigint :event_id
      t.string :state

      t.timestamps
    end
    add_foreign_key :attendances, :users, column: :user_id
    add_foreign_key :attendances, :events, column: :event_id
  end
end
