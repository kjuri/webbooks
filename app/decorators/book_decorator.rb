class BookDecorator < Drape::Decorator
  include FontAwesome::Rails::IconHelper
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  delegate_all

  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime("%a %m/%d/%y")
    end
  end

  def cover_file
    cover.present? ? cover.url : 'placeholder.png'
  end

  def library_link(user)
    if in_library?(user)
      link_to fa_icon('minus-square', text: 'Remove from Library'),
        remove_from_library_book_path(id), method: :delete
    else
      link_to fa_icon('plus-square', text: 'Add to Library'), add_to_library_book_path(id)
    end
  end

  def average_rating
    "#{reviews.average(:rating).to_f.round(2)} / 10"
  end

  private

  def in_library?(user)
    user.shelves.any? { |shelf| shelf.books.include? object }
  end
end
