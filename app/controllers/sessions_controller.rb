class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      flash[:notice] = "ログインしました。"
      redirect_to user
    else
      flash[:alert] = "ログインできませんでした"
      render "new"
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
    logout
    redirect_to root_url
    
  end
end
