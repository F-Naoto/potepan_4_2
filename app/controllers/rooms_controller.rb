class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
  end

  def new
  @room = current_user.rooms.build
  end

  def create
  @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @current_user
    else
      render new_room_path
    end
  end
  
  def edit

  end

  def update

  end

  def destroy
    
  end

  def area_search
    # モデルクラス.where("カラム名 LIKE?", "検索したい文字列") 
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

