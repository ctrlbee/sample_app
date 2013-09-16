module UsersHelper

	def gravatar_for(u1)
		gravatar_hash = Digest::MD5::hexdigest(u1.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/"+gravatar_hash
		image_tag(gravatar_url, alt:"avatar", class:"gravatar")
	end

end
