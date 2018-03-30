require 'json'
class TrapUrlsController < ApplicationController
  def trap
    @hash_urls = Set.new

    @url = if TrapUrl.exists?(url_params[:url])
      TrapUrl.find(url_params[:url])
    else
      TrapUrl.create(url_params)
           end
    @test = @url.requests.create(request_data: request_as_json)
    @hash_urls.add @url.url
  end

  def index
    @trap_urls = TrapUrl.all
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
end
