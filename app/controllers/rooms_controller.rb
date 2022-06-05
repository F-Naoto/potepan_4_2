class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
  end

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

  def confirmation
    @reserving_room_price = params[:reservation][:price]
    @reserving_room_id = params[:reservation][:room_id]
    @reserving_to_when = params[:reservation][:to_when]
    @reserving_from_when = params[:reservation][:from_when]
    @reserving_stay_number = params[:reservation][:stay_number]
    # 何日使用するか日数を算出
    @how_long_stay = how_long_stay(@reserving_to_when, 
      @reserving_from_when)
      
      # 人数×部屋料金×日数で合計金額を算出
      @total_price = total_price(@reserving_room_price, @reserving_stay_number, @how_long_stay)
  end


  def area_search
    @areas = Room.where("address LIKE?", "%#{params[:search][:area]}%")
  end

  def key_search
    @keywords = Room.where("introduction Like?", "%#{params[:search][:keyword]}%")
  end

  # Date型 - Date型は有理数なのでintegerに変換する必要あり
  def how_long_stay(to_when, from_when)
    return (to_when.to_date - from_when.to_date).to_i
  end

  def total_price(price, num, how_long)
    return price.to_i * num.to_i * how_long.to_i
  end
  

  
    private
      def room_params
        params.require(:room).permit(:name, :introduction, :price, :address, :img, :user_id)
      end
end

