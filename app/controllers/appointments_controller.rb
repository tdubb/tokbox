class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    role = (current_user.role + "_id").to_sym if current_user.role
    if params[:user_id]
      @title = "My Appointments"
      @appointments = Appointment.where(role => current_user.id) || []
    else
      @title = "Open Appointments"
      @appointments = Appointment.where(role => nil) || []
    end
  end

  def show
    begin
      appointment = Appointment.find(params[:id])
      @key = ENV["TOKBOX_API_KEY"]
      @secret = ENV["TOKBOX_API_SECRET"]
      @session = appointment.session
      @token = appointment.token
    rescue
      @create_appointment = true
    end
  end

  def new
  end

  def create
    opentok = TokBox.new.opentok
    @session = opentok.create_session
    @token = @session.generate_token
    @appointment = Appointment.new(session: @session, token: @token)
    @appointment.save
    redirect_to appointments_path
  end

  def edit
  end

  def update
    appointment = Appointment.find(params[:id])
    if params[:type] == "patient"
      appointment.patient_id = current_user.id
    else
      appointment.doctor_id = current_user.id
    end
    appointment.save
    redirect_to appointments_path
  end

  def destroy
  end
end
