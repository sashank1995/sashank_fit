class DiseasesController < ApplicationController
  def new
    @disease =  Disease.new
  end

  def index
    @diseases = Disease.all
  end

  def show
    @disease = Disease.find(params[:disease_id])
    @symptom = Symptom.filtering(params[:id])
  end

  def create
    disease = Disease.new(name: params[:disease][:name])
    disease.save!
    redirect_to show_disease_path(disease)
  end

end
