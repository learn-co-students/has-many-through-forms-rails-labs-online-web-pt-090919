class UsersController < ApplicationController

  def show
    @user = User.where(params[:id]).includes(:comments => :post).first
  end

  def index
    @users = User.all
  end
end
