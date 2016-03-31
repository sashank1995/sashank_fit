class SymptomsController < ApplicationController

  def new
    @disease = Disease.find(params[:disease_id])
    @symptom = @disease.symptoms.build
  end

  def create
    @disease = Disease.find(params[:disease_id])
    @symptom = @disease.symptoms.create(symptom_params)
    if params[:symptom][:name].present?

    else
      Symptom.inserting(@disease,@symptom)
    end
    redirect_to show_disease_path(:disease_id)
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end
