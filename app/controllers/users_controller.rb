class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, notice: "Account has been created successfully."
    else
      render 'new'
    end
  end
end
