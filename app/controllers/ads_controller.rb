class AdsController < ApplicationController
  def index
    render json: Ad.all
  end
end
