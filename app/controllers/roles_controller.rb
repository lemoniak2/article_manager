class RolesController < ApplicationController
  expose(:roles)
  expose(:role, attributes: :role_params)

  def create
    if role.save
      redirect_to roles_path
    end
  end

  def destroy
    role.delete
    redirect_to roles_path
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
