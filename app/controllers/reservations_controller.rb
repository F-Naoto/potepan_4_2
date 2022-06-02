class ReservationsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def new
    # @reservation = current_user.reservations.build
  end

  def create
    @price = params[:reservation][:price]
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
      params.require(:reservation).permit(:from_when, :to_when, :stay_number, :room_id)
    end
end


