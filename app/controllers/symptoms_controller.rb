class SymptomsController < ApplicationController

  def new
    @disease = Disease.find(params[:disease_id])
    @symptom = @disease.symptoms.build
  end

  def create
    @disease = Disease.find(params[:disease_id])
    if Symptom.where(name: params[:symptom][:name]).present?
      #Flash message
    else
      @disease.symptoms.create(symptom_params)
      #Symptom.inserting(@disease,@symptom)
    end
    redirect_to show_disease_path(params[:disease_id])
  end

  def destroy
    Symptom.find(params[:id]).destroy
    redirect_to show_disease_path(params[:disease_id])
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end
