class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def openid_connect
    auth = request.env['omniauth.auth']

    unless @user = User.find_by(uid: auth.uid)
      @user = User.create(uid: auth.uid)
    end
    @user.info = auth.to_json
    @user.save!

    sign_in_and_redirect @user, event: :authentication
  end

  def after_omniauth_failure_path_for(scope)
    root_path
  end
end
