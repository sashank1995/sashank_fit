class SymptomsController < ApplicationController

  def new
    if doctor_signed_in?
      @disease = Disease.find(params[:disease_id])
      @symptom = @disease.symptoms.build
    else 
      #flash
    end
  end

  def create
    if doctor_signed_in?
      @disease = Disease.find(params[:disease_id])
      if @disease.symptoms.where(name: params[:symptom][:name]).present?
        #Flash message
      else
        @disease.symptoms.create(symptom_params)
        #Symptom.inserting(@disease,@symptom)
      end
      redirect_to show_disease_path(params[:disease_id])
    else
      #flash
    end
  end

  def destroy
    if doctor_signed_in?
      Symptom.find(params[:id]).destroy
      redirect_to show_disease_path(params[:disease_id])
    else
      #flash
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end
