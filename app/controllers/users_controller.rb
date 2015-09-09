class UsersController < ApplicationController
  skip_before_action :find_user, only: [:new, :create]

  def new
    @user = User.new
    # enter new email address
  end

  def create
    if params[:isrando] == '1'
      @user = Provider.create(
        firstname:    Faker::Name.first_name,
        lastname:     Faker::Name.last_name,
        personemail:  Faker::Internet.email,
        recordtypeid: '012700000009miG'
      )
    else
      @user = Provider.find_by_personemail params[:user][:personemail]
    end
    # swap user
    session[:user] = @user.personemail
    redirect_to root_path
  end

  def show
  end
end