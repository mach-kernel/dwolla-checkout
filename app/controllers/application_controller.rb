class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :not_configured?

  # Very simple session management. We don't need anything fancy.
  def not_configured?
  	DwollaVars.Dwolla::token.nil? && DwollaVars.pin.nil?
  end

end
