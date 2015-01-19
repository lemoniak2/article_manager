class UserRolesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    user.add_role(params[:role][:name])
    redirect_to users_path
  end

  def destroy
    role = Role.find(params[:id])
    user = User.find(params[:user_id])
    user.remove_role(role[:name])
    redirect_to users_path
  end
end
