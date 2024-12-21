Rails.application.routes.draw do
  devise_for :users

  namespace :api do 
    namespace :v1 do 
      devise_scope :user do 
        post "sign_up", to: "sessions#sign_up"
      end
    end
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

end
