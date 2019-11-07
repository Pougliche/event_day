class AttendancesController < ApplicationController
  before_action :authenticate_user
  before_action :find_event, only: [:create]

  def index
    @attendances = Attendance.all
  end

  
  def show
  end

  def new
    @attendance = Attendance.new
  end

  def edit
  end

  def create
    if already_participate?
      flash[:danger] = "Il n'est pas possible de s'inscrire plusieurs fois a un evenement"
      redirect_to event_path(@event)
    else
      @event.attendances.create(user_id: current_user.id)
      redirect_to event_path(@event), flash: {success: 'Super, vous etes insrit a un nouvel evenement !'}
    end
  end

  def destroy
    @attendance.destroy
      redirect_to events_path, notice: 'Attendance was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def find_attendance
      @attendance = Attendance.where(user_id: current_user.id, event_id: params[:event_id]).first
    end

    def find_event
      @event = Event.find(params[:event_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.fetch(:attendance, {})
    end

    def already_participate?
      Attendance.where(user_id: current_user.id, event_id: params[:event_id]).exists?
    end

end
