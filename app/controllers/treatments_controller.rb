class TreatmentsController < ApplicationController

  def new
    @disease = Disease.find(params[:id])
    @treatment = @disease.disease_treatments.build
  end

  def create
    @disease = Disease.find(params[:id])
    treatment = @disease.disease_treatments.create(treatment_params)

    if treatment.save!
      redirect_to root_path(params[:id])
    else
      render 'new'
    end
  end

  def edit
    #@disease = Disease.find_by(:id => params[:id])
   # @treatment = @disease.disease_treatments
   @treatment = DiseaseTreatment.find_by(:id => params[:id])
  end

  def update
    @disease = Disease.find_by(:id => params[:disease_id])
    @treatment = DiseaseTreatment.find(params[:id])
    if @treatment.update_attributes(treatment_params)
      redirect_to root_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def treatment_params
    params.require(:disease_treatment).permit(:medicine, :food, :activities)
  end
end
