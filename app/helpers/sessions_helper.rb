module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    # @current_user = User.find_by(id:user.id)　これではだめ？
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id:session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
