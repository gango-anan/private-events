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
FactoryBot.define do
  factory :event do
    event_name { "MyString" }
    description { "MyText" }
    event_venue { "MyString" }
    event_date { "2021-02-13 16:59:04" }
    user_id { "" }
  end
end
