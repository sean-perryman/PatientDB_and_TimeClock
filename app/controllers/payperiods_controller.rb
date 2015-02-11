class PayperiodsController < ApplicationController
  before_action :set_payperiod, only: [:show, :edit, :update, :destroy]

  # GET /payperiods
  # GET /payperiods.json
  def index
    @payperiods = Payperiod.all
  end

  # GET /payperiods/1
  # GET /payperiods/1.json
  def show
  end

  # GET /payperiods/new
  def new
    @payperiod = Payperiod.new
  end

  # GET /payperiods/1/edit
  def edit
  end

  # POST /payperiods
  # POST /payperiods.json
  def create
    @payperiod = Payperiod.new(payperiod_params)

    respond_to do |format|
      if @payperiod.save
        format.html { redirect_to payperiods_path, notice: 'Pay period was successfully created.' }
        format.json { render :index, status: :created, location: @payperiod }
      else
        format.html { render :new }
        format.json { render json: @payperiod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payperiods/1
  # PATCH/PUT /payperiods/1.json
  def update
    respond_to do |format|
      if @payperiod.update(payperiod_params)
        format.html { redirect_to @payperiod, notice: 'Pay period was successfully updated.' }
        format.json { render :show, status: :ok, location: @payperiod }
      else
        format.html { render :edit }
        format.json { render json: @payperiod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payperiods/1
  # DELETE /payperiods/1.json
  def destroy
    @payperiod.destroy
    respond_to do |format|
      format.html { redirect_to payperiods_url, notice: 'Pay period was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payperiod
      @payperiod = Payperiod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payperiod_params
      params.require(:payperiod).permit(:start, :end)
    end
end
