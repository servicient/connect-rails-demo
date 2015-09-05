class UsersController < ApplicationController
  skip_before_action :find_user, only: [:new, :create]

  def new
    @user = User.new
    # enter new email address form
  end

  def create
    @user = Provider.find_by_personemail params[:user][:personemail]
    session[:user] = @user.personemail
    redirect_to root_path
    # swap user
  end

  def show
  end
end