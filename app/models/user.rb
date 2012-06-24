class User < ActiveRecord::Base
  has_many :identities

  # attr_accessible :email

  def self.create_with_omniauth(info)
    create! do |user|
      user.fullname = info['name']
    end
  end
end
