::Refinery::Application.routes.draw do
  resources :staff_directories, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :staff_directories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
