class Comment < ActiveRecord::Base
  belongs_to :user, :polymorphic => true
  belongs_to :disease
end
