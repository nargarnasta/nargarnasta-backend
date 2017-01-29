class FetchTripsController < ApplicationController
  def index
  	origin 					= params['originId']
  	destination 		= params['destinationId']
  	transportation_means = params['transportation_means']
  	fetched_data 		= FetchExternalData.call(origin: origin, destination: destination)
  	@filtered_data 	= FilterExternalData.call(fetched_data)
  	@filtered_data 	= IncludeOnlyTransportation.call(@filtered_data, transportation_means) if transportation_means.present?
  	render status: :success
  end
end
