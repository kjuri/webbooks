class ReviewDecorator < Drape::Decorator
  delegate_all

  def rating
    "#{object.rating.present? ? object.rating : '-'} / 10"
  end
end
