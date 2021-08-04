# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryBot.create(:admin_user)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
  end
end
