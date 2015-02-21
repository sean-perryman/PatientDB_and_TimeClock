class TimeentriesController < ApplicationController
  before_action :set_timeentry, only: [:show, :edit, :update, :destroy]


  # GET /timeentries
  # GET /timeentries.json
  def index
    @timeentries = Timeentry.all
  end

  # GET /timeentries/1
  # GET /timeentries/1.json
  def show
  end

  # GET /timeentries/new
  def new
    @timeentry = Timeentry.new
  end

  # GET /timeentries/1/edit
  def edit
  end

  # POST /timeentries
  # POST /timeentries.json
  def create
    if User.where('id' => timeentry_params[:user_id]).exists? 
      @user = User.find(timeentry_params[:user_id])
    elsif User.where('employee_id' => timeentry_params[:user_id]).exists?
      @user = User.find_by_employee_id(timeentry_params[:user_id])
    else
      @user = nil
    end

    if @user != nil
      # Pull the latest timeentry row for that user id
      @timeentry = Timeentry.where( 'user_id' => @user.id ).last
      
      # check if record from before exists
      if @timeentry.present?
        # if time_in is null
        if @timeentry.time_in.blank?
          # Create new time entry with time_in set to temp_time
          @timeentry.update( 'time_in' => timeentry_params[:temp_time])
          @timeentry.save
        # else if time_in is not null, time_out is null, and time_in is from today
        elsif @timeentry.time_in.present? && @timeentry.time_out.blank? && @timeentry.time_in.today?
          # populate time_out with temp_time
          @timeentry.update( 'time_out' => timeentry_params[:temp_time] )
          @timeentry.save
        else
          # else create a new time entry with time_in set to temp_time
          @timeentry = Timeentry.new( 'user_id' => @user.id, 'time_in' => timeentry_params[:temp_time])
        end
      else
        # else create a new time entry with time_in set to temp_time
        @timeentry = Timeentry.new( 'user_id' => @user.id, 'time_in' => timeentry_params[:temp_time])
      end

      respond_to do |format|
        if @timeentry.save
          format.html { redirect_to root_path, notice: 'Time entry was successfully created.' }
          format.json { render :show, status: :created, location: @timeentry }
        else
          format.html { render :new }
          format.json { render json: @timeentry.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :new_timeentry, :alert => 'Invalid user ID specified.'
    end
  end

  # PATCH/PUT /timeentries/1
  # PATCH/PUT /timeentries/1.json
  def update
    respond_to do |format|
      if @timeentry.update(timeentry_params)
        format.html { redirect_to root_path, notice: 'Time entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeentry }
      else
        format.html { render :edit }
        format.json { render json: @timeentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeentries/1
  # DELETE /timeentries/1.json
  def destroy
    @timeentry.destroy
    respond_to do |format|
      format.html { redirect_to timeentries_url, notice: 'Time entry was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeentry
      @timeentry = Timeentry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeentry_params
      params.require(:timeentry).permit(:user_id, :temp_time, :time_in, :time_out)
    end
end
