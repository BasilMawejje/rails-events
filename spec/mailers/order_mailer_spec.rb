# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderMailer, type: :mailer do
  describe 'order email' do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { OrderMailer.order_details(user.email) }

    it 'renders the headers' do
      expect(mail.subject).to eq("You're ticket has been booked.")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['admin@railsevents.com'])
    end

    it 'renders the body' do
      expect(mail.subject).to include("You're ticket has been booked.")
      expect(mail.attachments).not_to be_empty
    end
  end
end
