class UsersController < ApplicationController
  before_filter :force_token, except: [:create]

  def create
    user = User.create params[:user]
    render json: user.to_json
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes params[:user]
      render json: user.to_json
    end
  end
end
