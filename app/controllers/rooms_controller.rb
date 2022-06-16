class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
  end

  def show
    @reservation = current_user.reservations.build
    @room = Room.find(params[:id])
    @user = User.find_by(id:current_user.id)
  end

  def new
    @room = current_user.rooms.build
  end

  def create
  @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:alert] = "ルーム登録に成功しました。"
      redirect_to room_path(@room)
    else
      flash.now[:alert] = "ルーム登録に失敗しました。"
      render new_room_path
    end
  end

  def area_search
    @areas = Room.where("address LIKE?", "%#{params[:search][:area]}%")
  end

  def key_search
    @keywords = Room.where("introduction Like?", "%#{params[:search][:keyword]}%")
  end

  
    private
      def room_params
        params.require(:room).permit(:name, :introduction, :price, :address, :img, :user_id)
      end
end

