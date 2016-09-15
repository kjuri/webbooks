class BookDecorator < Drape::Decorator
  delegate_all

  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime("%a %m/%d/%y")
    end
  end

  def cover
    cover_file_name || 'placeholder.png'
  end

end
