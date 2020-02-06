class ApplicationController < ActionController::API
  helper_method :full_url

  def info
    render json: {online: true}
  end

  def full_url(image)
    return nil unless image.url
    request.base_url + image.url.to_s
  end

end
