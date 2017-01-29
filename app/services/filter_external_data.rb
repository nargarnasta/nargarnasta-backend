class FilterExternalData
	include Service

	def call(fetched_data)
		a = []
		fetched_data['Trip'].each do |trip|
			origin 			= trip['LegList']['Leg'].first['Origin']
			destination	= trip['LegList']['Leg'].last['Destination']

			origin_date_time 			= TimeTool.convert_to_utc_as_iso8601(origin['date'], origin['time'])
			destination_date_time = TimeTool.convert_to_utc_as_iso8601(destination['date'], destination['time'])

			main_hash = {}
			main_hash['departure_time']	= origin_date_time
			main_hash['arrival_time'] 	= destination_date_time
			main_hash['legs'] = []
			insert_leg_data(trip['LegList']['Leg'], main_hash)
			a << main_hash
		end
		return a
	end

private
	def insert_leg_data(legs, main_hash)
		legs.each do |leg|
			h = {}
			if leg['Product'].present?
				hh = {}
				hh['cat_code'] 					= leg['Product']['catCode'].to_i
				hh['name'] 							= leg['Product']['name']
				hh['cat_code_meaning'] 	= transportation_cat_codes(hh['cat_code'])
				h['tranportation_mode'] = hh
			end
			h['originName'] 				= leg['Origin']['name']
			h['destinationName'] 		= leg['Destination']['name']
			h['originTime'] 				= TimeTool.convert_to_utc_as_iso8601(leg['Origin']['date'], leg['Origin']['time']) 
			h['destinationTime']		= TimeTool.convert_to_utc_as_iso8601(leg['Destination']['date'], leg['Destination']['time']) 
			main_hash['legs'] << h
		end
	end

	def transportation_cat_codes(code)
		case code
		when 1
			return "SnabbTåg, Express, Arlanda Express"
		when 2
			return "Regional, InterCity"
		when 3
			return "Expressbuss, Flygbussar"
		when 4
			return "Tåg, PågaTåg, Öresundståg"
		when 5 
			return "Tunnelbana"
		when 6
			return "Spårvagn"
		when 7
			return "Buss"
		when 8
			return "Färja"
		else
			return ""
		end
	end

end