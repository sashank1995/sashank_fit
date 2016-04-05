class TreatmentsController < ApplicationController

  def new
    if doctor_signed_in?
      @disease = Disease.find(params[:disease_id])
      @treatment = @disease.disease_treatments.build
    else
      redirect_to show_disease_path(params[:disease_id])
      flash[:danger] = "You are not authorized to perform this action"
    end
  end

  def create
    if doctor_signed_in?
      @disease = Disease.find(params[:disease_id])
      treatment = @disease.disease_treatments.create(treatment_params)

      if treatment.save!
        redirect_to show_disease_path(@disease)
        flash[:success] = "Successfully created a treatment"
      else
        render 'new'
        flash[:danger] = "COuld not create the treatment"
      end
    end
  end

  def edit
    if doctor_signed_in?
      @treatment = DiseaseTreatment.find_by(:id => params[:id])
      @disease = @treatment.disease
      #@disease = Disease.find_by(:id => params[:id])
      #@treatment = @disease.disease_treatments
    else
      redirect_to show_disease_path(params[:disease_id])
      flash[:danger] = "You are not authorized to perform this action"
    end
  end

  def update
    if doctor_signed_in?
      @disease = Disease.find(params[:disease_id])
      @treatment = DiseaseTreatment.find(params[:id])
      if @treatment.update_attributes(treatment_params)
        redirect_to show_disease_path(params[:disease_id])
        flash[:success] = "Successfully updated the treatment"
      else
        render 'edit'
      end
    end
  end

  def destroy
    if doctor_signed_in?
      DiseaseTreatment.find(params[:id]).destroy
      redirect_to show_disease_path(params[:disease_id])
      flash[:success] = "Treatment deleted"
    else
      redirect_to show_disease_path(params[:disease_id])
      flash[:danger] = "You are not authorized to perform this action"

    end
  end

  private

  def treatment_params
    params.require(:disease_treatment).permit(:medicine, :food, :activities)
  end
end
