class UsersController < ApplicationController
  before_action :set_user, only:%i[show edit update destroy]
  before_action :confirmation_logged_in, only:%i[update]
  before_action :correct_user, only:%i[edit]
  def index
    @rooms = Room.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:notice] = "登録に成功しました。"
      redirect_to profile_users_path
    else
      flash.now[:alert] = "登録に失敗しました。"
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新しました。"
      redirect_to profile_users_path(@user)
    else
      flash.now[:alert] = "更新できませんでした。"
      render "edit"
    end
  end

  def profile
    @user = User.find_by(id:current_user.id)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :self_introduction, :user_img)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless @user.id === current_user.id
    end

 
end
