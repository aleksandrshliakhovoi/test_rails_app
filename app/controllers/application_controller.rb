class ApplicationController < ActionController::Base
  #if we add something that will be available in every controller
  def render_403
    render file: 'public/403.html', status: :forbidden
  end

  def render_404
    render file: 'public/404.html', status: :not_found
  end
end
