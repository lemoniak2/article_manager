module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = FactoryGirl.create(:user)
      @user.add_role :author
      @user.add_role :reviewer
      @user.add_role :moderator
      @user.add_role :admin
      sign_in @user
    end
  end
end