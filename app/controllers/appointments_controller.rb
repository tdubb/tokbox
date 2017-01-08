class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all || []
  end

  def show
  end

  def new
  end

  def create
    opentok = TokBox.new.opentok
    @session = opentok.create_session
    @token = @session.generate_token
    @appointment = Appointment.new(session: @session, token: @token)
    @appointment.save
    redirect_to appointments_index_path
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
    redirect_to appointments_index_path
  end

  def destroy
  end
end
