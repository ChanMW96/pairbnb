class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(customer_id,host_id,reservation_id)
  	customer = User.find(customer_id)
  	host = User.find(host_id)
  	ReservationMailer.booking_email( customer, host, reservation_id ).deliver_now
  end
end
