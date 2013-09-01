module ApplicationHelper
  def brand_name
    'OWASP OC, OWASP LA, OWASP Bay Area, OWASP Santa Barbara'
  end

  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end
end
