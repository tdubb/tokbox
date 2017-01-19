require "opentok"
class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    begin
      appointment = Appointment.where(patient_id: current_user.id).or(Appointment.where(doctor_id: current_user.id)).first
      @key = ENV["TOKBOX_API_KEY"]
      @secret = ENV["TOKBOX_API_SECRET"]
      @session = appointment.session
      @token = appointment.token
    rescue
      @create_appointment = true
    end
  end
end
