module UsersHelper

	def gravatar_for(u1, options = {size: 90})
		gravatar_hash = Digest::MD5::hexdigest(u1.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/"+gravatar_hash+"?s="+size.to_s
		image_tag(gravatar_url, alt:"avatar", class:"gravatar")
	end

end
