class Identity < ActiveRecord::Base
  belongs_to :user

  # attr_accessible :password, :password_confirmation, :email, :provider, :uid
  # attr_accessible :provider, :uid

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth, user_id)
    Identity.create! do |id|
      id.provider = auth['provider']
      id.uid      = auth['uid']      
      id.user_id  = user_id
    end
  end
end
