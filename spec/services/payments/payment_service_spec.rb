# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payments::PaymentService, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'payment/json' } }
  
  describe 'GET /charges' do
    before { StripeMock.start }
    after { StripeMock.stop }
    context 'return 1 customer' do
      StripeMock.start
      let!(:customer) do
        Stripe::Customer.create(
          email: 'me@me.com',
          card: 'valid_card_token'
        )
      end
    end
    
    it 'creates a stripe customer' do
      customer = Stripe::Customer.create(
          :email => 'me@me.com',
          :card => 'valid_card_token'
      )
      expect(customer.email).to eq('me@me.com')
    end
  end

  describe 'POST /charges' do
    let(:stripe_helper) { StripeMock.create_test_helper }
    
    before { StripeMock.start }
    after { StripeMock.stop }
    let!(:customer) do
      Stripe::Customer.create(
        email: 'me@me.com',
        card: stripe_helper.generate_card_token
      )
    end
    
    let!(:customer) {Stripe::Customer.create(
        :email => 'me@me.com',
        :card => stripe_helper.generate_card_token
    )}

    it 'requires a valid card token' do
      expect do
        Stripe::Charge.create(
          amount: 99,
          currency: 'sek',
          source: 'bogus_card_token'
        )
      end.to raise_error(Stripe::InvalidRequestError)
    end

    it 'requires a valid customer or source', live: true do
      expect do
        Stripe::Charge.create(
          amount: 99,
          currency: 'sek'
        )
      end.to raise_error(Stripe::InvalidRequestError)
    end

    it 'requires presence of amount', live: true do
      expect do
        Stripe::Charge.create(
          currency: 'sek',
          source: stripe_helper.generate_card_token
        )
      end.to raise_error(Stripe::InvalidRequestError)
    end

    it 'creates a stripe charge item with a card token' do
      charge = Stripe::Charge.create(
        amount: 999,
        currency: 'sek',
        source: stripe_helper.generate_card_token,
        description: 'card charge'
      )

      expect(charge.id).to match(/^test_ch/)
      expect(charge.amount).to eq(999)
      expect(charge.description).to eq('card charge')
      expect(charge.captured).to eq(true)
      expect(charge.status).to eq('succeeded')
    end

    it 'creates a stripe charge item with a customer', live: true do
      customer = Stripe::Customer.create({
                                           email: 'me@me.com',
                                           source: stripe_helper.generate_card_token(number: '4012888888881881',
                                                                                     address_city: 'LA'),
                                           description: 'a description'
                                         })

      expect(customer.sources.data.length).to eq(1)
      expect(customer.sources.data[0].id).not_to be_nil
      expect(customer.sources.data[0].last4).to eq('1881')

      charge = Stripe::Charge.create(
        amount: 999,
        currency: 'sek',
        customer: customer.id,
        description: 'a charge with a specific customer'
      )

      expect(charge.id).to match(/^(test_)?ch/)
      expect(charge.amount).to eq(999)
      expect(charge.description).to eq('a charge with a specific customer')
      expect(charge.captured).to eq(true)
      expect(charge.source.last4).to eq('1881')
    end
  end
end