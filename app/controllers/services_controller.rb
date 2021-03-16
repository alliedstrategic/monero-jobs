# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]

  # GET /services
  def index
    @services = if current_user.is_admin
        Service.all
      else
        Service.where(
          user_id: current_user.id,
          coins: [cookies[:coin].presence] || ["xmr"],
        )
      end
  end

  # GET /services/1
  def show; end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit; end

  # POST /services
  def create
    @service = Service.new(service_params)

    @service.user_id = current_user.id

    # @service.apply_type = apply_type

    @service.coins << cookies[:coin].presence || "xmr"

    if @service.save
      redirect_to @service, notice: "Service was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    # TODO: add apply type check
    # @service.apply_type = apply_type

    if @service.update(service_params)
      redirect_to @service, notice: "Service was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    redirect_to services_url, notice: "Service was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_params
    params.require(:service).permit(:title, :how_to_contact, :category, :content)
  end
end
