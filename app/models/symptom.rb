class Symptom < ActiveRecord::Base
  has_and_belongs_to_many :diseases


  def self.filtering(sid)
    Symptom.joins(:diseases).where(diseases:{id: sid}).uniq
  end

end


