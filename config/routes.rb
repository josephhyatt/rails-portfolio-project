Rails.application.routes.draw do
  #defines route to the 7 restful actions in eventsController
  resources :events
end
