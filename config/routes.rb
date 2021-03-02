Rails.application.routes.draw do
  root to: 'dev/home#index'
  namespace :dev do
    root to: 'home#index'
    get 'board/board_geral'
    get 'auth/login'
    post 'auth/login'
    get 'auth/logout'
    get 'auth/new'
    post 'auth/new'
    resources :users
    get 'configuracao/profile'
    post 'configuracao/profile'
    get 'configuracao/profile_edit'
    post 'configuracao/profile_edit'
    get 'configuracao/noticia'
    post 'configuracao/noticia'
    get 'configuracao/convite'
    post 'configuracao/convite'
    get 'configuracao/usuario'
    post 'configuracao/usuario'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
