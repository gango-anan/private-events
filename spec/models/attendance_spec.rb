# == Schema Information
#
# Table name: attendances
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :bigint           not null
#  event_id    :bigint           not null
#
# Indexes
#
#  index_attendances_on_attendee_id  (attendee_id)
#  index_attendances_on_event_id     (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendee_id => users.id)
#  fk_rails_...  (event_id => events.id)
#
require 'rails_helper'

RSpec.describe Attendance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
