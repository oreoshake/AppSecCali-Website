RecruitLy::Application.routes.draw do
  resources :mailers, :only => [] do |mailer|
    collection do
      get :newsletter
      post :deliver
    end
  end

  resources :speakers do |speaker|
  	collection do
  		get :cfp
  	end
  end

  get :location, :controller => :welcome
  get :splash, :controller => :welcome
  get :contact, :controller => :welcome
  get :training, :controller => :welcome
  get :code_of_conduct, :controller => :welcome
  get :privacy, :controller => :welcome
  get :sponsorship, :controller => :welcome
  root 'welcome#index'

  resources :beta_requests, only: [:create, :index]
  post :csp_report, :controller => :csp
end
