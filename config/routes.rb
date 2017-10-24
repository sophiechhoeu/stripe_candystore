Rails.application.routes.draw do
  devise_for :users
  resources :items do
  member do
    resource :charge
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root to: "items#index"

end
