require "administrate/base_dashboard"

class PartDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    chapter: Field::BelongsTo,
    decision_point: Field::HasOne,
    progresses: Field::HasMany,
    id: Field::Number,
    content: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    title: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :chapter,
    :decision_point,
    :progresses,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :chapter,
    :decision_point,
    :progresses,
    :id,
    :content,
    :created_at,
    :updated_at,
    :title,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :chapter,
    :decision_point,
    :progresses,
    :content,
    :title,
  ].freeze

  # Overwrite this method to customize how parts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(part)
  #   "Part ##{part.id}"
  # end
end
