module ApplicationHelper
  def twitter_url(handle)
    "https://twitter.com/#{handle}"
  end

  def brand_name
    [link_to("OWASP OC", twitter_url('owaspoc')),
      link_to("OWASP LA", twitter_url('owaspla')),
      link_to("OWASP Santa Barbara", 'https://www.owasp.org/index.php/Santa_Barbara'),
      link_to("OWASP Bay Area", twitter_url('owaspbayarea'))].join(" ").html_safe
  end

  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end

  def hide_email(email)
    email[0] + "..." + email[email.index('@') - 1] + "@" + email[email.index("@") + 1] + "..."+ email[email.rindex('.') - 1..-1]
  end
end
