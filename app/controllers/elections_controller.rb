class ElectionsController < ApplicationController
  before_action :set_election, only: %i[ show edit update destroy ]

  # GET /elections or /elections.json
  def index
    @elections = Election.all
  end

  # GET /elections/1 or /elections/1.json
  def show
  end

  # GET /elections/new
  def new
    @election = Election.new
  end

  # GET /elections/1/edit
  def edit
  end

  # POST /elections or /elections.json
  def create
    @election = Election.new(election_params)

      if @election.save
        redirect_to root_path, notice: "Election was successfully created." 
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /elections/1 or /elections/1.json
  def update
    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to @election, notice: "Election was successfully updated." }
        format.json { render :show, status: :ok, location: @election }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/1 or /elections/1.json
  def destroy
    @election.destroy
    respond_to do |format|
      format.html { redirect_to elections_url, notice: "Election was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election
      @election = Election.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def election_params
      params.require(:election).permit(:title, :description, :started)
    end
end
