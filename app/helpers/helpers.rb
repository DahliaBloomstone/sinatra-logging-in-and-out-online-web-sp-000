class Helpers < ActiveRecord::Base

#current user
#accept session hash as an argument and use the user id from the session hash to find the user in the database and return that user. 
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

#is logged in?
  def self.is_logged_in?(session)
    !!session[:user_id]
  end
end
