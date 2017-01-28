class FilterLegs
	include Service

	def call(trips)
		a = []
		trips.each do |trip|
			h = {}
			dep_time 	= trip['LegList']['Leg'][0]['Stops']['Stop'][0]['depTime']
			dep_date 	= trip['LegList']['Leg'][0]['Stops']['Stop'][0]['depDate']
			arr_time 	= trip['LegList']['Leg'][0]['Stops']['Stop'][1]['arrTime']
			arr_date 	= trip['LegList']['Leg'][0]['Stops']['Stop'][1]['arrDate']
			dep = TimeTool.convert_to_utc_as_iso8601(dep_date, dep_time)
			arr = TimeTool.convert_to_utc_as_iso8601(arr_date, arr_time)
			h['departure_time']	= dep
			h['arrival_time'] 	= arr
			a << h
		end
		return a
	end
end




