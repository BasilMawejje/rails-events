# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe OrderMailerWorker, type: :worker do
  describe 'send an email' do
    let(:user) { FactoryBot.create(:user) }

    before(:each) do
      Sidekiq::Worker.clear_all
    end

    it 'should respond to #perform' do
      expect(OrderMailerWorker.new).to respond_to(:perform)
    end

    it 'queues job' do
      worker_options = {
        user: user
      }

      expect do
        described_class.perform_async(worker_options)
      end.to change(described_class.jobs, :size).from(0).to(1)
    end
  end
end
