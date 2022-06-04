class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = current_user.reservations.build
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)

    if @reservation.save!
      redirect_to root_url
    end
  end
  
  def edit

  end

  def update

  end

  def destroy
    
  end


    private
    def reservation_params
      params.permit(:from_when, :to_when, :stay_number, :total_price, :room_id)
    end
end


