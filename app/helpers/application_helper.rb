module ApplicationHelper
  def bootstrap_class_for(message_type)
    case message_type.to_sym
    when :primary
      'primary'
    when :success
      'success'
    when :danger
      'danger'
    when :warning
      'warning'
    when :info
      'info'
    when :light
      'light'
    when :dark
      'dark'
    else
      'secondary'
    end
  end
end
