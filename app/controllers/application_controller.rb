class ApplicationController < ActionController::API
  rescue_from NameError, with: :rescue404

  def current_user
    @current_user ||= User.find_by(token: request.headers[:Authorization])
  end

  private

  def rescue404(e)
    @exception = e
    render json: { status: 404, message: @exception }
  end
end
