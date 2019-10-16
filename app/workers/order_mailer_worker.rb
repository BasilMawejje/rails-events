class OrderMailerWorker
  include Sidekiq::Worker

  def perform(user)
    OrderMailer.order_details(@user).deliver
  end
end
