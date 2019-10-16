require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'DB table' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :user_id}
  end
end
