class RequestToJSON
  def self.to_json(request)
    JSON.generate(
      request: {
        creation_date: Time.zone.now,
        remote_ip: request.remote_ip,
        scheme: request.scheme,
        headers: request.headers,
        cookies: request.cookies,
        query_params: request.query_parameters,
        query_string: request.query_string,
        request_method: request.request_method
      }
    )
  end
end
