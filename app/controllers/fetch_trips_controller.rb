class FetchTripsController < ApplicationController
  def index
  	origin 					= params['originId']
  	destination 		= params['destinationId']
  	fetched_data 		= FetchExternalData.call(origin: origin, destination: destination)
  	@filtered_data 	= FilterExternalData.call(fetched_data)
  end
end
