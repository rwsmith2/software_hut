# == Schema Information
#
# Table name: admins
#
#  admin_id :integer          not null, primary key
#  user_id  :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.user_id) ON DELETE => cascade
#
require 'rails_helper'

RSpec.describe Admin, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  user = User.create(email: "domin@gmail.com",password: "password" ,user_name: "domin@gmail.com", is_admin: true) #user_id = 2
  admin = Admin.create(user_id: user.user_id)

  describe "#admin_id" do
    it 'has admin_id' do
      expect(admin.admin_id).to eq admin.admin_id
    end
  end

  describe "#user_id" do
    it 'has user_id' do
      expect(admin.user_id).to eq user.user_id
    end
  end

  describe "#user" do
    it 'has user' do
      expect(admin.user.user_id).to eq admin.user_id
    end
  end
end
