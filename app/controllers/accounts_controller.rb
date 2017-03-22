class AccountsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:new, :create]
  def new
    @account = Account.new
  end

  def create
    #binding.pry

    @account = Account.new(account_params)
    if @account.save
      @current_account = Account.where(id: session[:current_account_id]).first
      if @current_account.role == "admin"
        redirect_to admin_accounts_path
      else
        redirect_to root_path
      end
    else
      render :new
    end
  end

  private
  def account_params
    params.require(:account).permit(:name, :email, :password)
  end
end
