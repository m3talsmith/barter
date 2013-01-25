class UsersController < ApplicationController
  def create
    user = User.create params[:user]
    render json: user.to_json
  end
end
