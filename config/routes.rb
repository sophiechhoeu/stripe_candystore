Rails.application.routes.draw do

# get 'transactions/index'

  devise_for :users
  resources :items do
  member do
    resource :charge
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/mypurchase', to: 'transactions#index', as: 'mypurchase'

root to: "items#index"

end
