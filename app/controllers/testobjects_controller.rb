class TestobjectsController < ApplicationController
  before_action :set_testobject, only: [:show, :edit, :update, :destroy]

  # GET /testobjects
  # GET /testobjects.json
  def index
    @testobjects = Testobject.all
  end

  # GET /testobjects/1
  # GET /testobjects/1.json
  def show
  end

  # GET /testobjects/new
  def new
    @testobject = Testobject.new
  end

  # GET /testobjects/1/edit
  def edit
  end

  # POST /testobjects
  # POST /testobjects.json
  def create
    @testobject = Testobject.new(testobject_params)

    respond_to do |format|
      if @testobject.save
        format.html { redirect_to @testobject, notice: 'Testobject was successfully created.' }
        format.json { render :show, status: :created, location: @testobject }
      else
        format.html { render :new }
        format.json { render json: @testobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testobjects/1
  # PATCH/PUT /testobjects/1.json
  def update
    respond_to do |format|
      if @testobject.update(testobject_params)
        format.html { redirect_to @testobject, notice: 'Testobject was successfully updated.' }
        format.json { render :show, status: :ok, location: @testobject }
      else
        format.html { render :edit }
        format.json { render json: @testobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testobjects/1
  # DELETE /testobjects/1.json
  def destroy
    @testobject.destroy
    respond_to do |format|
      format.html { redirect_to testobjects_url, notice: 'Testobject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testobject
      @testobject = Testobject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testobject_params
      params.require(:testobject).permit(:ad_source_connection_id, :impressions, :revenue, :revenue_ecpm, :bid, :bid_rate)
    end
end
