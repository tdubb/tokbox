require "opentok"
class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    begin
      appointment = Appointment.where(patient_id: current_user.id).or(Appointment.where(doctor_id: current_user.id)).first
      @key = "45746092"
      @secret = "856a9189e2a50dc87660f40f3fd65abad8dc5306"
      @session = appointment.session
      @token = appointment.token
    rescue
    end
  end
end
