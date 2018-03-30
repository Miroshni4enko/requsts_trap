class TrapUrlsController < ApplicationController

  def trap
    @hash_urls = Set.new
    if TrapUrl.exists?(url_params[:url])
      @hash_urls.add(url_params[:url])
    else
      @hash_urls =  TrapUrl.create(url_params)
    end
  end

  def index
    @trap_urls = TrapUrl.all
  end


  private

  def url_params
    params.permit(:url)
  end
end
