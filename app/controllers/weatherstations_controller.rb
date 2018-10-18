class WeatherstationsController < ApplicationController
  before_action :set_weatherstation, only: [:show, :update, :destroy]

  # GET /api/weatherstations
  def index
    @weatherstations = Weatherstation.all
    json_response(@weatherstations)
  end

  # POST /api/weatherstations
  def create
    @weatherstation = Weatherstation.create!(weatherstation_params)
    json_response(@weatherstation, :created)
  end

  # GET /api/weatherstations/:id
  def show
    json_response(@weatherstation)
  end

  # PUT /api/weatherstations/:id
  def update
    @weatherstation.update(weatherstation_params)
    head :no_content
  end

  # DELETE /api/weatherstations/:id
  def destroy
    @weatherstation.destroy
    head :no_content
  end

  private

  def weatherstation_params
    # whitelist params
    params.permit(:name)
  end

  def set_weatherstation
    @weatherstation = Weatherstation.find(params[:id])
  end
end
