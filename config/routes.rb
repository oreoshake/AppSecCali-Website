RecruitLy::Application.routes.draw do
  resources :volunteers, only: [:create, :index]
  resources :beta_requests, only: [:create, :index]

  resources :speakers do |speaker|
  	collection do
  		get :cfp
  	end
  end

  get :schedule, :controller => :welcome
  get :location, :controller => :welcome
  get :splash, :controller => :welcome
  get :contact, :controller => :welcome
  get :hotels, :controller => :welcome
  get '/training' => redirect("/")
  get :code_of_conduct, :controller => :welcome
  get :privacy, :controller => :welcome
  get :sponsorship, :controller => :welcome
  get :registration, :controller => :welcome
  root 'welcome#index'


  post :csp_report, :controller => :csp
end
