class FilterExternalData
	include Service

	def call(fetched_data)
		a = []
		fetched_data['Trip'].each do |trip|
			origin 			= trip['LegList']['Leg'].first['Origin']
			destination	= trip['LegList']['Leg'].last['Destination']

			origin_date_time 			= TimeTool.convert_to_utc_as_iso8601(origin['date'], origin['time'])
			destination_date_time = TimeTool.convert_to_utc_as_iso8601(destination['date'], destination['time'])
			puts origin_date_time
			
			h = {}
			h['departure_time']	= origin_date_time
			h['arrival_time'] 	= destination_date_time
			h['legs'] = []
			s = trip['LegList']['Leg'].each do |leg|
				# hh = {}
				# hh[]
			end

			h['legs'] = [
				{
					'tranportation_mode': '',
					'originName': "",
					'destinationName': "",
					'originTime': "",
					'destinationTime': ""
				},
				{
					'tranportation_mode': '',
					'originName': "",
					'destinationName': "",
					'originTime': "",
					'destinationTime': ""
				}
			]
			a << h
		end
		return a
	end
end