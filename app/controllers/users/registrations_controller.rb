class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if request.method == "DELETE"
      render status: :ok
    elsif request.method == "POST" && resource.persisted?
      render json: {
        user: current_user.as_json(except: :jti)
        }, status: :ok
    else
      render json: {
        messages: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end
