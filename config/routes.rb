Rails.application.routes.draw do
  root 'welcome#index'

  put '/:url', to: 'trap_urls#trap'
  delete '/:url', to: 'trap_urls#trap'
  post '/:url', to: 'trap_urls#trap'
  get '/:url', to: 'trap_urls#trap'
  patch '/:url', to: 'trap_urls#trap'
  get '/requests/all', to: 'trap_urls#index'
  get '/:url/requests', to: 'trap_urls#show'

  mount ActionCable.server => '/cable'



  # For details on the DSL available within this file, see http://guurles.rubyonrails.org/routing.html
end
