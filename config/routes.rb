Rails.application.routes.draw do
  patch 'votes/cast_vote'
  post 'sessions/login'
  post 'sessions/register'
  delete 'sessions/logout'
  get 'votes/results'
end
