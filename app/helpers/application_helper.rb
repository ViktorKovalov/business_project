module ApplicationHelper
  def bootstrap_class_for(message_type)
    case message_type.to_sym
    when :success
      'success'
    when :error, :alert
      'danger'
    when :notice
      'info'
    else
      'other'
    end
  end
end
