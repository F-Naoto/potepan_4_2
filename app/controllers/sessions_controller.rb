class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      flash[:notice] = "ログインしました。"
      redirect_to profile_users_path
    else
      flash.now[:alert] = "ログインできませんでした"
      render "new"
    end
  end

  def destroy
    logout
    flash[:notice] = "ログアウトしました。"
    redirect_to root_url
  end

    private
    def confirmation_logged_in
      unless logged_in?
        redirect_to new_session_path
      end
    end
end
