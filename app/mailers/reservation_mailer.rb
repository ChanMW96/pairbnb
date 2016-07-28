class ReservationMailer < ApplicationMailer
	def booking_email(customer,host,reservation_id)
		@customer = customer
		@host = host
		@url = "localhost:3000/reservations/#{reservation_id}"
		mail(to: @customer.email, subject: 'Your Reservation')
	end
end
