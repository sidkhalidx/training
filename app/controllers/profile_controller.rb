class ProfileController < ApplicationController
    def index
        @profiles = Profile.all
    end
    def new
        @profile = Profile.new
    end
    def create
        
    end
end
