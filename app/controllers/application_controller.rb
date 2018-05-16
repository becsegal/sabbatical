class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  NotAuthorized = Class.new(ActionController::RoutingError)


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  rescue_from ApplicationController::NotAuthorized do |exception|
    render_error_page(status: 403, text: 'Forbidden', template: 'errors/unauthorized')
  end

  private

  def render_error_page(status:, text:, template: 'errors/routing')
    respond_to do |format|
      format.json { render json: {errors: [message: "#{status} #{text}"]}, status: status }
      format.html { render template: template, status: status }
      format.any  { head status }
    end
  end
end
