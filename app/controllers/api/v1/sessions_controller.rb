class Api::V1::SessionsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: :create
  skip_before_action :verify_authenticity_token

  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: resource, status: :created
    else
      render json: { message: resource.errors.full_messages },
             status: :bad_request
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :phone_number ])
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
end
