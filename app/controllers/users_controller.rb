class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user = User.new(user_params)

  end

  def pictures_params
  params.require(:user).permit(:artist, :title, :url)
  end

end
