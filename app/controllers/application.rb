# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :prepare_session

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '6868268f040b27ba87b0275dd085b606'
  
  #--{ Authentication Checks }--
  
    #--{ This is just syntax sugar }--
    def is_logged_in?
      @user = User.find(session[:user_id]) if session[:user_id]
    end

    #--{ Use as a before filter to all private controllers }
    def force_login
      unless is_logged_in?
        session[:previous_page] = request.url
        redirect_to login_users_path
      end
    end
    
  #--{ end }--
  
  
  
  #--{ Allowing us to easily redirect back to a page when forced away; such as when logging in }--
  def redirect_to_previous_page
    page = session[:previous_page]
    session[:previous_page] = nil
    redirect_to page
  end


  #--{ User Sessions: this allows us to time out after n amount of seconds }--
    #{ See config/environment.rb for the MAX_SESSION_TIME constant }
    
    def prepare_session
    
      #--{ If the world hasn't fallen apart and the stored expiration time is less ... Breath }--
      if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
         # Session has expired. Clear the current session.
         reset_session
      end
      
      #--{ Assign a new expiry time, whether the session has expired or not. }--
      session[:expiry_time] = MAX_SESSION_TIME.seconds.from_now
      return true
    end
    
  #--{ end }--
end
