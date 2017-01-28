Rails.application.routes.draw do
	scope :api do
	  scope :v1 do
		  get 'fetch_trips/index'
	  end
	end
end

# == Route Map
#
#            Prefix Verb URI Pattern                         Controller#Action
# fetch_trips_index GET  /api/v1/fetch_trips/index(.:format) fetch_trips#index
#
