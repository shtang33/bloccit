class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @specific_advertisement = Advertisement.find(params[:id])
  end
end
