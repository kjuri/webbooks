require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    shelves: Field::HasMany,
    books: Field::HasMany,
    progresses: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    roles_mask: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    city: Field::String,
    country: Field::String,
    bio: Field::Text,
    username: Field::String,
    birthday: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :shelves,
    :books,
    :progresses,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :shelves,
    :books,
    :progresses,
    :id,
    :email,
    :created_at,
    :updated_at,
    :roles_mask,
    :first_name,
    :last_name,
    :city,
    :country,
    :bio,
    :username,
    :birthday,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :shelves,
    :books,
    :progresses,
    :email,
    :roles_mask,
    :first_name,
    :last_name,
    :city,
    :country,
    :bio,
    :username,
    :birthday,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
