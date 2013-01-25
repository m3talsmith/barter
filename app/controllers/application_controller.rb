class ApplicationController < ActionController::Base
  protect_from_forgery

private
  def force_token
    unless params[:token]
      render json: {message: 'you are not authorized'}.to_json, status: 401
    end
  end
end
