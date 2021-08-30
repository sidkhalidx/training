class DoctorsController < ApplicationController
    def create
        # byebug
        @patient = Patient.find(params[:patient_id])
        @doctor = @patient.doctors.create(params.require(:doctor).permit(:name, :degree, :name_confirmation))
        # byebug
        redirect_to patient_path(params[:patient_id])
    end
    def destroy
        @p = Patient.find(params[:patient_id])
        @d = @p.doctors.find(params[:id])
        @d.destroy
        redirect_to patient_path(@p)
    end
    def show
        @doctor = Doctor.find(params[:id])
    end
end
