class ReservationsController < ApplicationController
  before_action :confirmation_logged_in, only:%i[index show new create]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    roomId = current_user.reservations.find_by(id:params[:id]).room_id
    @room = Room.find_by(id:roomId)
  end
    
  def new
    @reservation = current_user.reservations.build
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save!
      flash[:message]="予約に成功しました。"
      redirect_to reservation_path(@reservation)
    end
  end
  
  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
    private
    def reservation_params
      params.permit(:from_when, :to_when, :stay_number, :total_price, :room_id)
    end
end


