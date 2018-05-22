module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    ## Run this method before on an devise controller
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  #This is so name is a  valid parameter on these devise controller actions.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end