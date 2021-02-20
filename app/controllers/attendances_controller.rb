class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      redirect_to root_path, notice: "Successfully Added new attendee!"
    else
      flash.now.alert = "#{ @attendance.errors.full_messages }"
      render 'new'
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :user_id)
  end
end
