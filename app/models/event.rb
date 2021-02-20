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
class Event < ApplicationRecord
  validates :event_name, uniqueness: true
  validates :event_name, :event_venue, :event_date, :description, presence: true
  belongs_to :user, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances

  def self.past
    past_events = []
    all.each do |event|
      past_events << event if event.event_date < DateTime.now
    end

    past_events
  end

  def self.upcoming
    up_events = []
    all.each do |event|
      up_events << event if event.event_date > DateTime.now
    end

    up_events
  end
end
