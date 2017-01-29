class FetchExternalData
	include Service

	def call(origin:, destination:)
		key 				= ENV['RES_ROBOT_KEY']
		format			= 'format=json'
		types_of_transportation = 'products=240'
		lang				=	'lang=en'
		base_url		= 'https://api.resrobot.se/v2/trip'
		url 				= "#{base_url}?key=#{key}&originId=#{origin}&destId=#{destination}&#{format}&#{types_of_transportation}&#{lang}&originWalk=0,0,0,0"
		uri 				= URI(url)
		response 		= Net::HTTP.get(uri)
		JSON.parse(response)
	end

	# 'https://api.resrobot.se/v2/trip?key=cba67d44-69e3-4362-a1d7-1531e2711afe&originId=740020749&destId=740053057&format=json&products=240'
end