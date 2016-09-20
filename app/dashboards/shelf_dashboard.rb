require "administrate/base_dashboard"

class ShelfDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    library: Field::BelongsTo,
    user: Field::BelongsTo,
    books: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    private: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :library,
    :user,
    :books,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :library,
    :user,
    :books,
    :id,
    :name,
    :description,
    :private,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :library,
    :user,
    :books,
    :name,
    :description,
    :private,
  ].freeze

  # Overwrite this method to customize how shelves are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(shelf)
  #   "Shelf ##{shelf.id}"
  # end
end
