module ApplicationHelper
  def flash_type(flash)
    return 'success' if flash.notice
    return 'warning' if flash.alert
    return 'danger' if flash.error
    'info'
  end
end
