class DiseasesController < ApplicationController
  def new
    @disease =  Disease.new
  end

  def index
    @diseases = Disease.all
  end

  def show
    @disease = Disease.find(params[:disease_id])
    @symptom = @disease.symptoms
    @comment = @disease.comments.build
    @comments = @disease.comments.all
    #@symptom = Symptom.filtering(params[:id])
  end

  def create
    if Disease.where(name: params[:disease][:name]).present?
      flash[:danger] = "Disease already exists"
      redirect_to root_path
    else
      disease = Disease.new(disease_params)
      disease.save
      redirect_to show_disease_path(disease)
    end
  end

  private

  def disease_params
    params.require(:disease).permit(:name)
  end

end
