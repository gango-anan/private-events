# == Schema Information
#
# Table name: attendances
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_attendances_on_event_id  (event_id)
#  index_attendances_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Attendance, type: :model do
  def create_event(name: "2020-Party") 
    user = User.create!(username: "#{ SecureRandom.hex(4) }")
    Event.create!(
      event_name: name,
      description: "#{ SecureRandom.hex(4) }",
      event_venue: "#{ SecureRandom.hex(4) }",
      event_date: Time.now,
      creator_id: user.id
    )
  end
  describe "# valid" do
    it "is valid if it has both event and attendee" do
      event = create_event
      user = User.create!(username: "#{ SecureRandom.hex(4) }")

      attendance = Attendance.create!(event_id: event.id, attendee_id: user.id)
      expect(attendance).to be_valid

      attendance = Attendance.new(event_id: event.id)
      expect(attendance).not_to be_valid

      attendance = Attendance.new(attendee_id: user.id)
      expect(attendance).not_to be_valid
    end
  end
end
