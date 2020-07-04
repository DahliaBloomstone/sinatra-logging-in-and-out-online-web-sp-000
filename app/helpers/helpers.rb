class Helpers < ActiveRecord::Base

#current user
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

#is logged in?
  def self.is_logged_in?(session)
    !!session[:user_id]
  end
end
