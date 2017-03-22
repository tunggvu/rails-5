class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_account!
  skip_before_action :authenticate_account!, only: [:new, :create]
  def authenticate_account!
    if session[:current_account_id]
      @current_account = Account.where(id: session[:current_account_id]).first
    end

    return redirect_to accounts_login_path unless @current_account
  end
end


