class CommentsController < ApplicationController

  def new 
    @disease = Disease.find(params[:disease_id])
    @comment = @disease.comments.build 
  end

  def index
    @disease = Disease.find(params[:id])
    @comments  = @disease.comments.all
  end

  def create
    @disease = Disease.find(params[:id])
    @comment = @disease.comments.create(comment_params)
    @comment.user_type = current_user.class
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Successfully saved comment."
      redirect_to show_disease_path(@disease)
    else
      render :action => 'new'
    end
  end

  def show
    @disease = Disease.find(params[:disease_id])
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :user_type)
  end

end
