# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  event_date  :datetime         not null
#  event_name  :string           not null
#  event_venue :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_events_on_event_name  (event_name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#valid?" do
    def create_event(name: "Party-After-Party") 
      user = User.create!(username: "#{ SecureRandom.hex(4) }")
      Event.create!(
        event_name: name,
        description: "#{ SecureRandom.hex(4) }",
        event_venue: "#{ SecureRandom.hex(4) }",
        event_date: Time.now,
        user_id: user.id
      )
    end

    it "is valid if the Event Name is unique" do
      event1 = create_event
      expect(event1).to be_valid
    end

    it "is invalid if Event Name is already used" do
      event2 = create_event(name: "Gambino-Concert")
      event3 = Event.new(event_name: "Gambino-Concert")
      expect(event3).not_to be_valid
    end

    it "is invalid if Event Name is empty or nil" do
      event = create_event(name: "Chetto-Survivors")
      
      event.event_name = ""
      expect(event).not_to be_valid

      event.event_name = nil
      expect(event).not_to be_valid
    end

    it "is valid if it has a Venue" do
      event = create_event
      expect(event).to be_valid

      event.event_venue = ""
      expect(event).not_to be_valid

      event.event_venue = nil
      expect(event).not_to be_valid
    end

    it "is valid if it has an Event Date" do
      event = create_event
      expect(event).to be_valid

      event.event_date = ""
      expect(event).not_to be_valid

      event.event_date = nil
      expect(event).not_to be_valid
    end

    it "is valid if it has a description" do
      event = create_event
      expect(event).to be_valid

      event.description = ""
      expect(event).not_to be_valid

      event.description = nil
      expect(event).not_to be_valid

    end
  end
end
