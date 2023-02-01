class Displayable < ApplicationRecord
    has_one_attached :file
    has_one_attached :material
    # color must be valid hex code
    validates :color, format: { with: /\A#(?:[0-9a-fA-F]{3}){1,2}\z/, message: 'must be a valid hex color code' }

end
