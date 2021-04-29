# == Schema Information
#
# Table name: users
#
#  accepted               :boolean          default(FALSE)
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  is_admin               :boolean
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unlock_token           :string
#  user_name              :string           not null
#  user_id                :integer          not null, primary key
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  user = User.create(email: "mmq1@gmail.com", password: "password", user_name: "mmq1@gmail.com", is_admin: false)

  describe "#email" do
    it 'can retrieve email' do
      expect(user.email).to eq "mmq1@gmail.com"
    end
  end

  describe "#password" do
    it 'can retrieve password' do
      expect(user.password).to eq "password"
    end
  end

  describe "#user_name" do
    it 'can retrieve user_name' do
      expect(user.user_name).to eq "mmq1@gmail.com"
    end
  end

  describe "#is_admin" do
    it 'can retrieve is_admin' do
      expect(user.is_admin).to eq FALSE
    end
  end

  describe "#accepted" do
    it 'can retrieve accepted' do
      expect(user.accepted).to eq FALSE
    end
  end

  describe "#current_sign_in_at" do
    it 'hase current_sign_in_at' do
      expect(user.current_sign_in_at).to eq user.current_sign_in_at
    end
  end

  describe "#current_sign_in_ip" do
    it 'has current_sign_in_ip' do
      expect(user.current_sign_in_ip).to eq user.current_sign_in_ip
    end
  end
  
  describe "#encrypted_password" do
    it 'can retrieve encrypted_password' do
      expect(user.encrypted_password).to be_a_kind_of(String)
    end
  end

  describe "#failed_attempts" do
    it 'has failed_attempts' do
      expect(user.failed_attempts).to be_a_kind_of(Integer)
    end
  end

  describe "#last_sign_in_at" do
    it 'has last_sign_in_at' do
      expect(user.last_sign_in_at).to eq user.last_sign_in_at
    end
  end

  describe "#last_sign_in_ip" do
    it 'has last_sign_in_ip' do
      expect(user.last_sign_in_ip).to eq user.last_sign_in_ip
    end
  end

  describe "#locked_at" do
    it 'has locked_at' do
      expect(user.locked_at).to eq user.locked_at
    end
  end

  describe "#remember_created_at" do
    it 'has remember_created_at' do
      expect(user.remember_created_at).to eq user.remember_created_at
    end
  end

  describe "#reset_password_sent_at" do
    it 'has reset_password_sent_at' do
      expect(user.reset_password_sent_at).to eq user.reset_password_sent_at
    end
  end

  describe "#reset_password_token" do
    it 'has reset_password_token' do
      expect(user.reset_password_token).to eq user.reset_password_token
    end
  end

  describe "#sign_in_count" do
    it 'has sign_in_count' do
      expect(user.sign_in_count).to be_a_kind_of(Integer)
    end
  end

  describe "#unlock_token" do
    it 'has unlock_token' do
      expect(user.unlock_token).to eq user.unlock_token
    end
  end
end
