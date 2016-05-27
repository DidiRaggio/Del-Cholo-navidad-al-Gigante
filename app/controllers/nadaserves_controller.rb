class NadaservesController < ApplicationController
  before_action :set_nadaserf, only: [:show, :edit, :update, :destroy]

  # GET /nadaserves
  # GET /nadaserves.json
  def index
    @nadaserves = Nadaserve.all
  end

  # GET /nadaserves/1
  # GET /nadaserves/1.json
  def show
  end

  # GET /nadaserves/new
  def new
    @nadaserf = Nadaserve.new
  end

  # GET /nadaserves/1/edit
  def edit
  end

  # POST /nadaserves
  # POST /nadaserves.json
  def create
    @nadaserf = Nadaserve.new(nadaserf_params)

    respond_to do |format|
      if @nadaserf.save
        format.html { redirect_to @nadaserf, notice: 'Nadaserve was successfully created.' }
        format.json { render :show, status: :created, location: @nadaserf }
      else
        format.html { render :new }
        format.json { render json: @nadaserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nadaserves/1
  # PATCH/PUT /nadaserves/1.json
  def update
    respond_to do |format|
      if @nadaserf.update(nadaserf_params)
        format.html { redirect_to @nadaserf, notice: 'Nadaserve was successfully updated.' }
        format.json { render :show, status: :ok, location: @nadaserf }
      else
        format.html { render :edit }
        format.json { render json: @nadaserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nadaserves/1
  # DELETE /nadaserves/1.json
  def destroy
    @nadaserf.destroy
    respond_to do |format|
      format.html { redirect_to nadaserves_url, notice: 'Nadaserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nadaserf
      @nadaserf = Nadaserve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nadaserf_params
      params.require(:nadaserf).permit(:ad_source_connection_id, :impressions, :revenue, :revenue_ecpm, :bid, :bid_rate, :start_timestamp, :end_timestamp)
    end
end
