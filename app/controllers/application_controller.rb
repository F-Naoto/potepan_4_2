class ApplicationController < ActionController::Base
  include SessionsHelper

    private
    def confirmation_logged_in
      unless logged_in?
        redirect_to new_session_path
      end
    end
end
