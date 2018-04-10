require 'json'
require 'request_to_json'
class TrapUrlsController < ApplicationController
  rescue_from StandardError, with: :return_failed

  def trap
    @url = TrapUrl.create_if_not_exist(url_params)
    if @url
      trap_request = @url.requests.new(request_data: RequestToJSON.to_json(request))
      if trap_request.save
        @url.increment!(:amount)
        ActionCable.server.broadcast 'requests',
                                     url: trap_request.request_data
        head :ok
      end
    end
  end

  def index
    @trap_urls = TrapUrl.all
  end

  def show
    @url_requests = Set.new
    @url = url_params[:url]
    url_requests = Request.where(url: @url)
    url_requests.each do |request|
      @url_requests.add(JSON.parse(request.request_data))
    end
  end

  private

  def url_params
    params.permit(:url)
  end



  def return_failed(exception)
    logger.error exception.message
    render json: { success: false }, status: 500
  end

end
