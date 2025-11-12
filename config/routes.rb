Rails.application.routes.draw do
  # Root path
  root "pages#home"
  
  # Pages
  get "trabalhos", to: "pages#work", as: :work
  get "sobre", to: "pages#about", as: :about
  get "contato", to: "pages#contact", as: :contact
  
  # Case study detail page (slug-based)
  get "trabalhos/:slug", to: "pages#case_study", as: :case_study
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
