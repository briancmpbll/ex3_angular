# Model for castes.
class Caste < ActiveRecord::Base
  include Nameable

  belongs_to :character_type
end
