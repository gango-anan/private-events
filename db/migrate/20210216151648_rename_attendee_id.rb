class RenameAttendeeId < ActiveRecord::Migration[6.1]
  def change
    rename_column :attendances, :attendee_id, :user_id
  end
end
