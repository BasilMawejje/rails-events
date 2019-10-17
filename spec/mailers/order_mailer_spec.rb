require "rails_helper"

RSpec.describe OrderMailer, :type => :mailer do
  describe "order email" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { OrderMailer.order_details(user.email) }

    it "renders the headers" do
      expect(mail.subject).to eq("You're ticket has been booked.")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["admin@railsevents.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("")
    end
  end
end
