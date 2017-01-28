class TimeTool

	def self.get_offset_seconds
		Time.now.utc.in_time_zone('Europe/Stockholm').utc_offset
	end

	def self.get_offset_minutes
		minutes_per_hour = 60
		offset_in_minutes = get_offset_seconds / minutes_per_hour
		offset_in_minutes
	end

	def self.convert_to_utc_as_iso8601(date, time)
		time = Time.zone.parse(date + ' ' + time)
		time = time + (get_offset_minutes * -1).minutes
		time.utc.iso8601
	end

end