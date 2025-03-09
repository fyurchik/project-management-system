class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def render_json_response(success, data, status)
    if success
      render json: { success: success, data: data }, status: status
    else
      data = [ data ] if data.instance_of?(String)

      render json: { success: success, errors: data }, status: status
    end
  end

  def handle_entity_result(result, status)
    if result.errors.any?
      render_json_response(false, result.errors.full_messages, :unprocessable_entity)
    else
      render_json_response(true, result, status)
    end
  end
end
