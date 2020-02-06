class AdsController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]
  before_action :find_ad, only: [:destroy, :show, :update]

  def index
    @ads = Ad.all
    @content_length = params.has_key?(:content_length) ? params[:content_length].to_i : 80
    render :index, formats: :json
  end

  def show
    render :show, formats: :json
  end

  def create
    ad = Ad.new(ad_params)
    ad.user = $current_user
    if ad.save
      head(:ok)
    else
      render json: {errors: ad.errors.full_messages}, status: 400
    end
  end

  def destroy
    @ad.destroy ? head(200) : head(400)
  end

  def update
    if @ad.update(ad_params)
      head(:ok)
    else
      render json: {errors: @ad.errors.full_messages}, status: 400
    end
  end
  

  private

  def ad_params
    params.require(:ad).permit(:title, :content, :background)
  end

  def find_ad
    @ad = Ad.find(params[:id])
  end

end
