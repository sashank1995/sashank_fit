class Symptom < ActiveRecord::Base
  has_and_belongs_to_many :diseases


  #def self.filtering(sid)
    #Symptom.joins(:diseases).where(diseases:{id: sid}).uniq
  #end

  #def self.inserting(disease, symptom)
    #ActiveRecord::Base.connection.execute('insert into diseases_symptoms values(symtpom.id, disease.id, symptom.id);')
  #end
end


