module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-dismissible" roloe="alert"> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    default_url = "http://globovation.s3.amazonaws.com/img/pink_gravatar_default.png"
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end