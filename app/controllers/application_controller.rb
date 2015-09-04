class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :find_user

  private
    def find_user
      @user = Account.find_by_personemail ENV['LOGIN_EMAIL'] || 'jimthetrainer@aol.com'
    end
end
