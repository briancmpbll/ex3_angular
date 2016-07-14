# Model for merit types.
class Merit < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
end
