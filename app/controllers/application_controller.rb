class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_out_path_for(current_user)
   new_user_session_path
  end

  config.to_prepare do
    Devise::SessionsController.layout "devise"
    Devise::RegistrationsController.layout "devise"
    Devise::ConfirmationsController.layout "devise"
    Devise::UnlocksController.layout "devise"
    Devise::PasswordsController.layout "devise"
  end
end
