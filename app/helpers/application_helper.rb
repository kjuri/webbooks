module ApplicationHelper
  def flash_type(flash)
    return 'success' if flash.notice
    return 'warning' if flash.alert
    return 'danger' if flash.error
    'info'
  end

  def root_path
    if Rails.env.production?
      Rails.application.routes.url_helpers.root_url(host: 'leszczyna.wzks.uj.edu.pl/11_szmigiel/webbooks')
    else
      Rails.application.routes.url_helpers.root_path
    end
  end
end
