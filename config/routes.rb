RecruitLy::Application.routes.draw do
  resources :speakers

  root 'welcome#index'

  resources :beta_requests, only: [:create, :index]
  post :csp_report, :controller => :csp
end
