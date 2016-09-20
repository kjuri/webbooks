require "administrate/base_dashboard"

class BookDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    chapters: Field::HasMany,
    parts: Field::HasMany,
    reviews: Field::HasMany,
    progresses: Field::HasMany,
    genres: Field::HasMany,
    shelves: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    short_description: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    subtitle: Field::String,
    cover_file_name: Field::String,
    cover_content_type: Field::String,
    cover_file_size: Field::Number,
    cover_updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :chapters,
    :parts,
    :reviews,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :chapters,
    :parts,
    :reviews,
    :progresses,
    :genres,
    :shelves,
    :id,
    :title,
    :short_description,
    :description,
    :created_at,
    :updated_at,
    :subtitle,
    :cover_file_name,
    :cover_content_type,
    :cover_file_size,
    :cover_updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :chapters,
    :parts,
    :reviews,
    :progresses,
    :genres,
    :shelves,
    :title,
    :short_description,
    :description,
    :subtitle,
    :cover_file_name,
    :cover_content_type,
    :cover_file_size,
    :cover_updated_at,
  ].freeze

  # Overwrite this method to customize how books are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(book)
  #   "Book ##{book.id}"
  # end
end
