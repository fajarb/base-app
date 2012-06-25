class Authentication < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :password, :password_confirmation
end
