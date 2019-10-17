class OrderMailerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user)
    OrderMailer.order_details(user).deliver
  end
end
