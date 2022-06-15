class ReservationsController < ApplicationController
  before_action :confirmation_logged_in, only:%i[index show new create]

  def index
    @reservations = current_user.reservations.order(updated_at: 'DESC')
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end
    
  def create
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(@reservation.room_id)
    render 'rooms/show' and return if params[:back] || !@reservation.save
    redirect_to @reservation
  end

  def confirmation
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(@reservation.room_id)
    @user = @reservation.user
    render 'rooms/show' if @reservation.invalid?
  end

  private
    def reservation_params
      params.require(:reservation).permit(:from_when, :to_when, :stay_number, :room_id, :user_id)
    end
end


