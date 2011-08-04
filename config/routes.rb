BackboneDemo::Application.routes.draw do
  # API
  namespace :api do
    scope :except => [:edit, :new], :defaults => { :format => 'json' } do
      resources :projects
      resources :tasks
    end
  end

  root :to => 'web_ui#show'
end
