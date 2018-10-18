class ClimatedatasController < ApplicationController
  before_action :set_weatherstation
  before_action :set_weatherstation_climatedata, only: [:show, :update, :destroy]

  # GET /api/weatherstations/:weatherstation_id/climatedatas
  def index
    json_response(@weatherstation.climatedatas)
  end

  # GET /api/weatherstations/:weatherstation_id/climatedatas/:id
  def show
    json_response(@climatedata)
  end

  # POST /api/weatherstations/:weatherstation_id/climatedatas
  def create
    @weatherstation.climatedatas.create!(climatedata_params)
    json_response(@weatherstation, :created)
  end

  # PUT /api/weatherstations/:weatherstation_id/climatedatas/:id
  def update
    @climatedata.update(climatedata_params)
    head :no_content
  end

  # DELETE /api/weatherstations/:weatherstation_id/climatedatas/:id
  def destroy
    @climatedata.destroy
    head :no_content
  end

  private

  def climatedata_params
    params.permit(:max_temp, :min_temp, :mean_temp, :total_rainfall, :total_sunshine, :month, :year)
  end

  def set_weatherstation
    @weatherstation = Weatherstation.find(params[:weatherstation_id])
  end

  def set_weatherstation_climatedata
    @climatedata = @weatherstation.climatedatas.find_by!(id: params[:id]) if @weatherstation
  end
end
