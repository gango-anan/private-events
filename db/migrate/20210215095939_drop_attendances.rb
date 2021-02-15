class DropAttendances < ActiveRecord::Migration[6.1]
  def change
    drop_table :attendances
  end
end
