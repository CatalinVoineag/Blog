class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :destroy]
#  before_action :correct_user, only: [:edit, :update, :show]
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :admin_user

  #after_filter :verify_authorized, only: [ :index] 

  def index
    @users = User.all
   # authorize @users
  end

   def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to admin_users_path, notice: "User Created" 
    else
      redirect_to admin_user_new_path
      flash[:error] = AlertsHelper.getErrorAlertMessages(@user)
    
    end
  end

  def edit
    @user
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "Profile Updated" 
    else
    redirect_to admin_user_edit_path(@user)
    flash[:error] = AlertsHelper.getErrorAlertMessages(@user)
    end
  end

  def destroy
    @user.destroy
    #authorize @user
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  def show
    @user
    #authorize @user
  end

  private

    # Before Filters

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_path
      end
    end

    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:error] = "You are not allowed to perform this action"
        redirect_to root_path 
      end
    end

    # Sets the current user for edit show update destroy
    def set_user
      @user = User.find(params[:id])
    end

    # Confirms an admin user
    def admin_user
      if current_user.nil? || !current_user.admin? 
        redirect_to root_path
        flash[:error] = "You are not allowed to perform that action"
      end 
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

end
