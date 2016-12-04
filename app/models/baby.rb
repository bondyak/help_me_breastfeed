class Baby < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations
  validates :name, :presence => true
  validates :birthdate, :presence => true

end
