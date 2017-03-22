class Admin::AccountsController < AdminController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find_by id: params[:id]
  end

  def destroy
    @account = Account.find_by id: params[:id]
    @account.destroy
    redirect_to admin_accounts_path
  end
end
