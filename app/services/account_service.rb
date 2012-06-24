class AccountService

  def self.create_with_omniauth(auth)
    user              = User.new
    user.email        = auth['info']['email']
    user.fullname     = auth['info']['name']
    
    identity          = user.identities.build
    identity.provider = auth['provider']
    identity.uid      = auth['uid']
    
    user.save!
    
    return user
  end

end