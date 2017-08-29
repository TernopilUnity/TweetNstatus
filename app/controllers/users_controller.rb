class UsersController < ApplicationController
  respond_to :html

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:User])
    @user.save
    respond_with @user
  end

  def show
    @user = User.find(params[:id])
  end
end
