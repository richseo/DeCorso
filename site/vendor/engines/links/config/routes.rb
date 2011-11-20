::Refinery::Application.routes.draw do
  resources :links, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :links, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
