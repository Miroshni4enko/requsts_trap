require 'json'
class TrapUrlsController < ApplicationController
  rescue_from StandardError, with: :return_failed
  def trap
    @hash_urls = Set.new

    @url = if TrapUrl.exists?(url_params[:url])
      TrapUrl.find(url_params[:url])
    else
      TrapUrl.create(url_params)
           end

    trap_request = @url.requests.new(request_data: request_as_json)

    if trap_request.save
    ActionCable.server.broadcast 'requests',
                                  url: trap_request.url
    head :ok
    end

    @hash_urls.add @url.url
  end

  def index
    @trap_urls = TrapUrl.all
  end

  def show
    @url_requests_attr = Set.new
    url_requests = Request.where(url: url_params[:url])
    url_requests.each do |request|
      @url_requests_attr.add(request.attributes)
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
    render json: {success: false}, status: 500
  end

end
