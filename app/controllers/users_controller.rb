class UsersController < ApplicationController
  before_action :set_user, only:%i[show edit update destroy]
  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録に成功しました。"
      redirect_to @user
    else
      flash.now[:alert] = "登録に失敗しました。"
      render "new"
    end
  end
  
  def edit
  end

  def update
      if @user.update(user_params)
        flash[:notice] = "更新しました。"
        redirect_to @user
      else
        flash.now[:alert] = "更新できませんでした。"
        render "edit"
      end
  end

  def destroy
  @user.destroy
  flash[:notice] = "アカウントを削除しました。"
  redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :self_introduction, :user_img)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
