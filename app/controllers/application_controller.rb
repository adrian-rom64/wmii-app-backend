class ApplicationController < ActionController::API

  def info
    render json: {online: true}
  end

end
