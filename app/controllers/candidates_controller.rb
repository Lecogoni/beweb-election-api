class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all
  end

  # GET /candidates/1 or /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
    @election_id = params[:election]
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates or /candidates.json
  def create

    @candidate = Candidate.new(candidate_params)
    
    if @candidate.save
        
        @candidate_declared = Candidate.where(election_id: @candidate.election_id, user_id: @candidate.user_id).count
        
        if @candidate.user_id.blank?
            @candidate.destroy
            redirect_to election_path(@candidate.election_id)
        end

        if  @candidate_declared > 1
            @candidate.destroy
            redirect_to election_path(@candidate.election_id), notice: "CE CANDIDAT EST DEJA DECLARE - IMPOSSIBLE DE LE DECLARER A NOUVEAU"
        else 
            redirect_to election_path(@candidate.election_id), notice: "Candidate was successfully created."
        end
    else
        redirect_to election_path(@candidate.election_id)
    end
    
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:election_id, :user_id, :slogan, :program)
    end
end
