class FetchExternalData
	include Service

	def call(origin:, destination:)
		key 				= ENV['RES_ROBOT_KEY']
		format			= 'format=json'
		types_of_transportation = 'products=240'
		base_url		= 'https://api.resrobot.se/v2/trip'
		url 				= "#{base_url}?key=#{key}&originId=#{origin}&destId=#{destination}&#{format}&#{types_of_transportation}"
		uri 				= URI(url)
		response 		= Net::HTTP.get(uri)
		JSON.parse(response)
	end

end