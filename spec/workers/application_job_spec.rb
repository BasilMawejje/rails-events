# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  it 'queues jobs' do
    ActiveJob::Base.queue_adapter = :test
    expect do
      ApplicationJob.perform_later
    end.to have_enqueued_job
  end
end
