Rails.application.routes.draw do

  root to: 'home#index'
  post "/links" => 'links#create'

  #Catch all, will catch /s/ANYTHING
    #lookup_code will be accessible in the show of controller
  get "/s/:lookup_code" => 'links#show'


end
