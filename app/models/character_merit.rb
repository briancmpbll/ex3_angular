# Model for a character's merit rating.
class CharacterMerit < ActiveRecord::Base
  belongs_to :character
  belongs_to :merit

  validates_presence_of :character
  validates_presence_of :merit
  validates_presence_of :value

  validate :value_is_valid

  private

  def value_is_valid
    return if merit.nil?

    unless merit.valid_values.include? value
      errors.add(:value,
                 "#{value} is not in valid values #{merit.valid_values}")
    end
  end
end
