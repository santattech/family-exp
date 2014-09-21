class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
    #TO DO: code clean up for bootstrap view
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end
