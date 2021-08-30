class PeopleController < ApplicationController
    def index
        @person = Person.all
        # byebug
    end
    def new
        @person = Person.new
    end
    def crate
        @person = Person.new(params.require(:person).permit(:name))
        if @person.save
            redirect_to people_path
        end
    end
    def show
        @person = Person.find(1)
    end
    def specific
        @person = Person.find(params[:id])
    end
    def edit
        @person = Person.find(params[:id])
        # byebug
    end
end