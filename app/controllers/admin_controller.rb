class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_contest, only: %i[ edit update destroy ]

  # GET /admin or /admin.json
  def index
    @contests = Contest.sorted
  end

  # GET /contests/1/edit
  def edit
  end

  # PATCH/PUT /contests/1 or /contests/1.json
  def update
    respond_to do |format|
      if @contest.update(verified: !@contest.verified)
        format.html { redirect_to admin_contests_path, notice: "Contest was successfully updated." }
        format.json { render :show, status: :ok, location: @contest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1 or /contests/1.json
  def destroy
    @contest.destroy

    respond_to do |format|
      format.html { redirect_to contests_url, notice: "Contest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end
end
