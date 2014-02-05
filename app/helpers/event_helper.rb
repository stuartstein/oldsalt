module EventHelper

	def format_date(d, with_year=true)
		return d if d.nil?
		with_year == true ? d.strftime("%b %e, %Y") : d.strftime("%b %e")
	end

	def format_hours(d, min=false)
		return d if d.nil?

		if d.strftime("%M") == "00" && !min
			d.strftime("%l %P")
		else
	 		d.strftime("%l:%M %P")
	 	end

	end

	def get_clue_url(url, width, height)

		if url.delete(".").include?("vimeocom")
			url = url.slice(url.index("com") + 4...url.size)
			%{<iframe src=\"//player.vimeo.com/video/#{url}?title=0&amp;byline=0&amp;portrait=0&amp;badge=0\" width=\"#{width}\" height=\"#{height}\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>}.html_safe

		elsif url.delete(".").include?("youtube")
			%{<iframe width=\"#{width}\" height=\"#{height}\" src=\"//www.youtube.com/embed/#{parse_video(url, "YouTube")}\" frameborder=\"0\" allowfullscreen></iframe>}.html_safe 
		else
			%{<img src = \"#{url}\", width=\"#{width}\", height=\"#{height}\">}.html_safe
		end

	end

	def parse_video(url, service)
   		if service == "YouTube"
   			regexp = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
   		elsif service == "Vimeo"
   			regexp = /http:\/\/(?:www.)?(vimeo|youtube).com\/(?:watch\?v=)?(.*?)(?:\z|&)/
   		end
   		url.match(regexp)[1]
	end

	def show_date(d)
		result = []
		if d.start_date.to_date === d.end_date.to_date
			result << format_date(d.start_date)
			result << "#{format_hours(d.start_date)} to #{format_hours(d.end_date)}"
		else !(d.start_date.year === d.end_date.year) || !(d.start_date.month === d.end_date.month)
			result << "#{format_hours(d.start_date)}, #{format_date(d.start_date)}"
			result << "to #{format_hours(d.end_date)}, #{format_date(d.end_date, false)}" 
		end
		result
	end

	def price_rounded(price)
		price.nil? ? nil : '%.0f' % price
	end
	
end
