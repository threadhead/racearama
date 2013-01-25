class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  # defaults removed -> :registerable :recoverable :validatable
  devise :database_authenticatable, :rememberable, :trackable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username


  #convenience method, just compares against the username becuase we are not using complex roles in the app
  def role?(role)
    role.to_s == self.username.downcase
  end

  def username_nice
    self.username.humanize.titleize
  end
end
