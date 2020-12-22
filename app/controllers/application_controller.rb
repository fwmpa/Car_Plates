class ApplicationController < ActionController::Base
  rescue_from Exception, with: :handle_exception

  private

  def handle_exception(error)
    flash[:alert] = error.message

    Rails.logger.info error.message

    redirect_to request.referer || root_path
  end
end
