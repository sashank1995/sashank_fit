class InteractionsController < ApplicationController

  def index
    @interaction = Interaction.new
    @interactions = Interaction.all
  end

  def create
    @interaction = Interaction.new(interaction_params)
    @interaction.usable_type=current_user.class
    @interaction.usable_id = current_user.id
    if @interaction.save
      flash[:success] = "Successfully saved comment"
      redirect_to interactions_path
    end
  end

  private

  def interaction_params
    params.require(:interaction).permit(:matter, :usable_id, :usable_type)
  end
end
