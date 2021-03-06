class User < ActiveRecord::Base
  rolify
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.add_role :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
