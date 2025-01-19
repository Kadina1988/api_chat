module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      private

      def respond_with(resource, params = {})
        if resource.persisted?
          render json: resource, status: :created
        else
          render json: resource.errors.messages, status: :unprocessable_entity
        end
      end
    end
  end
end
