class MissionsController < ApplicationController
  before_action :set_mission, only: %i[ show update destroy ]

  # GET /missions
  def index
    @missions = Mission.all
    render json: @missions, status: :ok
  end

  # GET /missions/1
  def show
    render json: @mission, status: :ok
  end

  # POST /missions
  def create
    mission = Mission.create!(mission_params)
    render json: mission.planet, status: :created
  end

  # def create
  #   mission = Mission.new(mission_params)

  #   mission.save!
  #     render json: @mission.planet, status: :created    
  # end

  # PATCH/PUT /missions/1
  def update
    if @mission.update(mission_params)
      render json: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /missions/1
  def destroy
    @mission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_params
      params.permit(:name, :scientist_id, :planet_id)
    end
end
