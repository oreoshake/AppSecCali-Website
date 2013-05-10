RecruitLy::Application.routes.draw do
  root 'welcome#index'

  resources :beta_requests, only: [:create]
end
