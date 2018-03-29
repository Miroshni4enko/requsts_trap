require 'set'
class TrapUrlsController < ApplicationController
  def trap
    @hash_urls = Set.new
    puts url_params
    if @hash_urls.add?(url_params[:url])
      puts 'new'
      TrapUrl.create(url_params)
    else
    end
    @hash_urls
  end

  def index
    @trap_urls = TrapUrl.all
  end


  private

  def url_params
    { url: params.require(:url) }
  end
end
