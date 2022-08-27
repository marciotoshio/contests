class ContestsController < ApplicationController
  before_action :set_contest, only: %i[ show registration ]

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  # GET /contests or /contests.json
  def index
      @contests = Contest.search(params[:q])
  end

  # GET /contests/1 or /contests/1.json
  def show
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  # POST /contests or /contests.json
  def create
    @contest = Contest.new(contest_params)

    respond_to do |format|
      if @contest.save
        format.html { redirect_to contests_path, notice: "Contest was successfully created." }
        format.json { render :show, status: :created, location: @contest }
      else
        # TODO: log error
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def registration
    respond_to do |format|
      if @contest.do_registration
        format.html { redirect_to contests_path, notice: "Successfully registered into contest." }
        format.json { render :show, status: :ok, location: @contest }
      else
        # TODO: log error
        format.html { redirect_to admin_contests_path, notice: "An error ocurred while registering into contest." }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.verified.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contest_params
      params.require(:contest).permit(:name, :description, :platform, :registration, :timings)
    end
end
