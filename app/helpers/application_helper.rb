module ApplicationHelper

  def gravitar_for(user, options = { size: 80 })
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    image_tag("https://www.gravatar.com/avatar/#{hash}?s=#{size}",
              alt: user.name, class: 'rounded mx-auto d-block mt-3')
  end

end
