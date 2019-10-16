require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'DB table' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :user_id}
    it {is_expected.to have_db_column :event_id}
  end

  context 'validations' do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:event)}
  end
end
