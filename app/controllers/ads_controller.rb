class AdsController < ApplicationController

  def index
    @ads = Ad.all
    @content_length = params.has_key?(:content_length) ? params[:content_length].to_i : 80
    render :index, formats: :json
  end

  def show
    @ad = Ad.find(params[:id])
    render :show, formats: :json
  end

end
