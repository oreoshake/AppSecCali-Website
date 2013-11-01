module ApplicationHelper
  def twitter_url(handle)
    "https://twitter.com/#{handle}"
  end

  def brand_name
    [
      link_to("OWASP OC", 'http://www.meetup.com/OWASP-OC/'),
      link_to("OWASP LA", 'http://www.meetup.com/OWASP-Los-Angeles/'),
      link_to("OWASP Santa Barbara", 'https://www.owasp.org/index.php/Santa_Barbara'),
      link_to("OWASP Bay Area", twitter_url('owaspbayarea')),
      link_to("OWASP San Deigo", 'https://www.owasp.org/index.php/SanDiego')
    ].join(" &mdash; ").html_safe
  end

  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end

  def nav_link(text, href, style = nil)
    klass = request.fullpath == href ? "active" : ""
    content_tag(:li, class: klass) do
      link_to text, href, style: style
    end
  end

  def maybe_add_active_to_about
    if [contact_path, privacy_path, code_of_conduct_path, volunteers_path].include?(request.fullpath)
      "active"
    end
  end

  def hide_email(email)
    email[0] + "..." + email[email.index('@') - 1] + "@" + email[email.index("@") + 1] + "..."+ email[email.rindex('.') - 1..-1]
  end
end
