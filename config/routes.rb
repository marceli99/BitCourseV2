Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  get '/api' => 'application#api', as: :api, :defaults => { :format => 'json' }
end
