class Disease < ActiveRecord::Base
  has_many :disease_treatments
  has_and_belongs_to_many :symptoms
end
