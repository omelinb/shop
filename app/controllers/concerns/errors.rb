module Errors
  def record_error
    render json: {
      error: {
        type: 'invalid_record_error',
        message: 'No product with such ID'
      }
    }, status: 400
  end

  def params_error(exception)
    render json: {
      error: {
        params: {
          code: 'required',
          message: "#{exception.param} cannot be blank.",
          name: exception.param
        },
        type: 'invalid_param_error',
        message: 'Invalid data parameters'
      }
    }, status: 400
  end

  def routing_error
    render json: {
      error: {
        type: 'invalid_request_error',
        message: "Unable to resolve the request '#{request.path}'"
      }
    }, status: 404
  end
end
