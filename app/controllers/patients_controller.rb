class PatientsController < ApplicationController
    protect_from_forgery except: :show
    layout Proc.new { |c| c.request.xhr? ? "pop" : "application" }
    
    def index
        @patients = Patient.all
        
    end
    def about
        byebug
    end
    def new
        @patients = Patient.new
    end
    def create
        @patient = Patient.new(params.require(:patient).permit(:name, :disease))
        if @patient.save
            redirect_to patients_path
        end
    end
    def edit
        @patient = Patient.find(params[:id])
    end
    def update
        @patient = Patient.find(params[:id])
        if @patient.update(params.require(:patient).permit(:name, :disease))
            redirect_to patient_path(@patient)
        end
    end
    def show
        append_view_path "app/views/just"
        flash.now[:alert] = "Your book was not found"
        if params[:id]
            @patient = Patient.find(params[:id])
        else
            @patient = Patient.find(1)
        end
        # byebug
        # head :created, location: patient_path()
        # render layout: "pop"
    end
end