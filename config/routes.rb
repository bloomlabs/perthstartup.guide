Rails.application.routes.draw do

  root 'companies#index'

  # post "/posts/:id" => "companies#approve"
  resources :companies do
    collection do 
      get :autocomplete
    end

    member do 
      post :approve
    end
  end

  # controller :companies do 
  # 	get 'autocomplete' => :autocomplete
  # end

end
