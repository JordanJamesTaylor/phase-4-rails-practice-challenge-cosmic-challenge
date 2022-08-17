class MissionsController < ApplicationController

    def index
        if params[:scientist_id]
            sci = Scientist.find(params[scientist_id])
            render json: sci.missions, only: [:id, :name]
        else
            render json: Mission.all
        end
    end

    def create
        mission = Mission.create!(mission_params)
        # Just send up the planet associated with the mission
        render json: mission.planet, status: :created
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

end
