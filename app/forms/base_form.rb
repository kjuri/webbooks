class BaseForm < Reform::Form
  include ::ActiveModel::Validations::Callbacks
end
