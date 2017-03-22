class SessionsController < ApplicationController

  skip_before_action :authenticate_account!, only: [:new, :create]

  def new
      redirect_to root_path if session[:current_account_id]
  end

  def create
    authorized_account = Account.authenticate(params[:email], params[:password])
    if authorized_account
      session[:current_account_id] = authorized_account.id
      redirect_to authorized_account.role == "admin" ? admin_root_path : root_path
    else
      render :new
    end
  end

  def destroy
    session[:current_account_id] = nil
    redirect_to accounts_login_path
  end

end
