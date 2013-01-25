class SessionsController < ApplicationController
  def create
    session = Session.authenticate(params[:email], params[:password])
    render json: {text: 'ok'}
  end
end
