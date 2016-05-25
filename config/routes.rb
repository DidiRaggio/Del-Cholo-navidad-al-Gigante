Rails.application.routes.draw do
  resources :testobjects
  root 'testobjects#index'
 
end
