Rails.application.routes.draw do
  get "pages/:title", to: "pages#show"
  get "pages/:title/edit", to: "pages#edit"
  post "pages/:title", to: "pages#update"
  get "pages", to: "pages#index"

  resources :users do
    get "page", to: "pages#show"
    get "page/edit", to: "pages#edit"
    post "page", to: "pages#update"
  end

  get "pad1", to: "basic#pad1"
end
