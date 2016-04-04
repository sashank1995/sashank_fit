class CommentsController < ApplicationController

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def create
    @disease = Disease.find(params[:id])
    @comment = @disease.comments.create(comment_params)
    if @comment.save
      flash[:notice] = "Successfully saved comment."
      redirect_to show_disease_path(@disease)
    byebug
    else
      render :action => 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :user_type)
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
end
