class SessionsController < ApplicationController

  def create
    # raise env['omniauth.auth'].to_yaml
    
    # Find an identity here
    identity = Identity.find_with_omniauth(env['omniauth.auth'])
  
    if logged_in?
      if identity
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it 
        # is the current user. So the identity is already associated with 
        # this user. So let's display an error message.
        redirect_to root_url, notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets 
        # associate the identity
        Identity.create_with_omniauth(env['omniauth.auth'], current_user.id)
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if identity
        # The identity we found had a user associated with it so let's 
        # just log them in here
        # self.current_user = identity.user
        session[:user_id] = identity.user_id
        redirect_to root_url, notice: "Signed in!"
      else
        # No user associated with the identity so we need to create a new one
        # redirect_to new_user_url, notice: "Please finish registering"
        # ---
        # New user - create user, set session and redirect to root
        # user = User.create_with_omniauth(auth['info'])
        # identity.update_attribute(:user_id, user.id)
        session[:user_id] = AccountService.create_with_omniauth(env['omniauth.auth']).id
        redirect_to root_url, notice: "Hello new user!"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    # self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end
end