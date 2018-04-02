require 'json'
class TrapUrlsController < ApplicationController
  rescue_from StandardError, with: :return_failed
  def trap
    @hash_urls = Set.new

    @url = if TrapUrl.exists?(url_params[:url])
      TrapUrl.find(url_params[:url])
           else
      TrapUrl.create({ url: url_params[:url],  amount: 0 })
           end

    trap_request = @url.requests.new(request_data: request_as_json)

    if trap_request.save
      TrapUrl.update(@url.url, amount: @url.amount + 1)
      ActionCable.server.broadcast 'requests',
                                   url: trap_request.request_data
      head :ok
    end

    @hash_urls.add @url.url
  end

  def index
    @trap_urls = TrapUrl.all
  end

  def show
    @url_requests = Set.new
    @url = url_params[:url]
    url_requests = Request.where(url:@url)
    url_requests.each do |request|
      @url_requests.add(JSON.parse(request.request_data))
    end
  end

  private

  def url_params
    params.permit(:url)
  end

  # @return [request as json]
  def request_as_json
    JSON.generate(
      request: {
        creation_date: Time.new,
        remote_ip: request.remote_ip,
        scheme: request.scheme,
        params: params,
        headers: request.headers,
        cookies: request.cookies,
        'query-params' => request.query_parameters,
        'query-string' => request.query_string,
        'request-method' => request.request_method
      }
    )
  end

  def return_failed(exception)
    logger.error exception.message
    render json: { success: false }, status: 500
  end

end
