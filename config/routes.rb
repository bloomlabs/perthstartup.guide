Rails.application.routes.draw do

  root 'companies#index'
  
  resources :companies do
    collection do 
      get :autocomplete
    end
  end

  # controller :companies do 
  # 	get 'autocomplete' => :autocomplete
  # end

end
