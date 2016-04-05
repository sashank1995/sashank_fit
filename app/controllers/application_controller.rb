class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_patient!, except: [:index, :show]
  #before_action :authenticate_doctor!, except: [:index, :show]

  def current_user
    if patient_signed_in?
      current_patient
    else
      current_doctor
    end
  end
end
