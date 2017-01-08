class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  config.to_prepare do
  Devise::SessionsController.layout "devise"
  Devise::RegistrationsController.layout "devise" 
  Devise::ConfirmationsController.layout "devise"
  Devise::UnlocksController.layout "devise"
  Devise::PasswordsController.layout "devise"
end
end
