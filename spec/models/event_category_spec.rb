require 'rails_helper'

RSpec.describe EventCategory, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryBot.create(:event_category)).to be_valid
    end
  end

  describe 'DB table' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :name}
  end

  context 'validations' do
    it {is_expected.to have_many(:events)}
  end
end
