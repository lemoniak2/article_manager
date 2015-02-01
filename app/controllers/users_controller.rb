class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_only
  expose(:roles) { Role.all }
  expose(:role) { Role.new }

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => t('user.update.success')
    else
      redirect_to users_path, :alert => t('user.update.denied')
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => t('user.deleted')
  end

  private

  def admin_only
    unless current_user.has_role? :admin
      redirect_to :root, :alert => t('user.access_denied')
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end
