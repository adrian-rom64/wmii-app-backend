class ApplicationController < ActionController::API
  respond_to :json

  def info
    render json: {online: true}
  end

end
