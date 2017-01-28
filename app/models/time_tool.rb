class TimeTool

	def self.convert_to_utc_as_iso8601(date, time)
		time = Time.parse(date + ' ' + time)
		time.utc.iso8601
	end

end