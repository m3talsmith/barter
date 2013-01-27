class SessionsController < ApplicationController
  def create
    session = Session.authenticate(params[:email], params[:password])
    render json: session.to_json
  end
end
