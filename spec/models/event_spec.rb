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
#  creator_id  :bigint           not null
#
# Indexes
#
#  index_events_on_event_name  (event_name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  def create_event(name: "Party-After-Party") 
    user = User.create!(username: "#{ SecureRandom.hex(4) }")
    Event.create!(
      event_name: name,
      description: "#{ SecureRandom.hex(4) }",
      event_venue: "#{ SecureRandom.hex(4) }",
      event_date: Time.now,
      creator_id: user.id
    )
  end

  describe "#valid?" do
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

  describe "#save" do
    user = User.create!(username: "#{ SecureRandom.hex(4) }")
    it "belongs to a user" do
      event = create_event
      expect(event).to be_persisted

      event1 = Event.new(
                event_name: "Party",
                description: "#{ SecureRandom.hex(4) }",
                event_venue: "#{ SecureRandom.hex(4) }",
                event_date: Time.now,
      )
      event1.save
      expect(event1).not_to be_persisted
    end

    context "where a user creates many events, " do
      user = User.create!(username: "#{ SecureRandom.hex(4) }")
      event1 = Event.create(
        event_name: "#{ SecureRandom.hex(2) }",
        description: "#{ SecureRandom.hex(2) }",
        event_venue: "#{ SecureRandom.hex(2) }",
        event_date: Time.now,
        creator_id: user.id
      )

      event2 = Event.create(
        event_name: "#{ SecureRandom.hex(2) }",
        description: "#{ SecureRandom.hex(2) }",
        event_venue: "#{ SecureRandom.hex(2) }",
        event_date: Time.now,
        creator_id: user.id
      )

      it "should allow a user to create multiple events" do
        expect(event1).to be_persisted
        expect(event2).to be_persisted
      end

    end
  end
end
