class Issue < ApplicationRecord
  # Direct associations

  has_many   :resources,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
