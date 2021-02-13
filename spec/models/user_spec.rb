# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  def create_a_user(name: "#{ SecureRandom.hex(4) }")
    User.create(username: name)
  end

  describe "#valid?" do
    it "is valid when username is unique" do
      create_a_user

      user = User.new
      user.username = "Gango"
      expect(user.valid?).to be true
    end

    it "is invalid if username is taken" do
      create_a_user(name: "galiwango")

      user = User.new
      user.username = "galiwango"
      expect(user).not_to be_valid
    end

    it "is invalid if the username is blank" do
      user = create_a_user

      user.username = ""
      expect(user).not_to be_valid

      user.username = nil
      expect(user).not_to be_valid
    end
  end
end
