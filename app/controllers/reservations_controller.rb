class ReservationsController < ApplicationController
  def new
    check_in = params[:reservation][:start_date]
    check_out = params[:reservation][:end_date]
    @reservation = Reservation.new(start_date:Date.strptime(check_in,"%d-%m-%Y"),end_date:Date.strptime(check_out,"%d-%m-%Y"),user_id:current_user.id,listing_id:params[:reservation][:listing_id])

  end

  def create
    @reservation = Reservation.new(start_date:params[:reservation][:start_date],end_date:params[:reservation][:end_date],user_id:current_user.id,listing_id:params[:reservation][:listing_id])
    @reservation.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
