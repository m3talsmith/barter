class UsersController < ApplicationController
  before_filter :force_token, except: [:create]
  before_filter :find_user, except: [:create]

  def create
    user = User.create params[:user]
    render json: user.to_json
  end

  def update
    if @user.update_attributes params[:user]
      render json: @user.to_json
    end
  end

  def destroy
    if @user.destroy
      render json: @user.to_json
    end
  end
private
  def find_user
    @user = User.find(params[:id])
  end
end
