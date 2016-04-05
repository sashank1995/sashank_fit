class SymptomsController < ApplicationController

  def new
    if doctor_signed_in?
      @disease = Disease.find(params[:disease_id])
      @symptom = @disease.symptoms.build
    else 
      redirect_to show_disease_path(params[:disease_id])
      flash[:danger] = "You are not authorized to perform this action"
    end
  end

  def create
    if doctor_signed_in?
      @disease = Disease.find(params[:disease_id])
      if @disease.symptoms.where(name: params[:symptom][:name]).present?
        flash[:danger] = "Symptom already exists"
      else
        @disease.symptoms.create(symptom_params)
        #Symptom.inserting(@disease,@symptom)
      end
      redirect_to show_disease_path(params[:disease_id])
      flash[:success] = "Symptom created"
    else
      flash[:danger] = "You are not authorized to perform this action"
    end
  end

  def destroy
    if doctor_signed_in?
      Symptom.find(params[:id]).destroy
      redirect_to show_disease_path(params[:disease_id])
      flash[:success] = "Symptom deleted"
    else
      redirect_to show_disease_path(params[:disease_id])
      flash[:danger] = "You are not authorized to perform this action"
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end
