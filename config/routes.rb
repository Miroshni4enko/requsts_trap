Rails.application.routes.draw do
  root 'welcome#index'

  get '/requests/all', to: 'trap_urls#index'
  get '/:url/requests', to: 'trap_urls#show'
  match '/:url(/*other)', to: 'trap_urls#trap', via: [:all]


  mount ActionCable.server => '/cable'



  # For details on the DSL available within this file, see http://guurles.rubyonrails.org/routing.html
end
