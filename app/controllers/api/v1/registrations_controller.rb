class Api::V1::RegistrationsController < Devise::RegistrationsController
  # def create
  #   debugger
  # end

  private

  def respond_with(resource, params = {})
    if resource.persisted?
      render json: resource, status: :created
    else
      render json: resource.errors.messages, status: :unprocessable_entity
    end
  end
end
