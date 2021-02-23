class Event < ApplicationRecord
  validates :event_name, uniqueness: true
  validates :event_name, :event_venue, :event_date, :description, presence: true
  belongs_to :user, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances

  scope :upcoming_events, -> { where('event_date >= ?', DateTime.now) }
  scope :past_events, -> { where('event_date <= ?', DateTime.now) }
end
