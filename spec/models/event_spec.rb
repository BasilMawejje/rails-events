# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryBot.create(:event_category)).to be_valid
      expect(FactoryBot.create(:event)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :event_category_id }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :image }
    it { is_expected.to have_db_column :alternate_image }
  end

  context 'validations' do
    it { should have_many(:orders) }
    it { should have_many(:users).through(:orders) }
  end
end
