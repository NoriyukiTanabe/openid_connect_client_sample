class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def openid_connect
    auth = request.env['omniauth.auth']
    unless @user = User.find_by(uid: auth.uid)
      @user = User.create(uid: auth.uid)
    end

    sign_in_and_redirect @user, event: :authentication
  end
end
