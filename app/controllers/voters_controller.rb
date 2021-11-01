class VotersController < ApplicationController
  before_action :set_voter, only: %i[ show edit update destroy ]

  # GET /voters or /voters.json
  def index
    @voters = Voter.all
  end

  # GET /voters/1 or /voters/1.json
  def show
  end

  # GET /voters/new
  def new
    @election_id = params[:election]

    if Voter.where(election_id: @election_id, user_id: current_user.id ).count >= 2
        redirect_to election_path(@election_id), notice: "vous avez déjà voté"
    else
        @voter = Voter.new
        @voter.election_id = @election_id
        @voter.user_id = current_user.id
        @voter.save
        redirect_to edit_voter_path(@voter)
    end
  end

  # GET /voters/1/edit
  def edit
  end

  # POST /voters or /voters.json
  def create
    @voter = Voter.new(voter_params)

    
    if @voter.save
        if @voter.candidate_id.blank?
            @voter.destroy
        end
        redirect_to @voter, notice: "Voter was successfully created." 
      else
        render :new, status: :unprocessable_entity 
      end
    end
  end

  # PATCH/PUT /voters/1 or /voters/1.json
  def update

      if @voter.update(voter_params)
        redirect_to election_path(@voter.election_id), notice: "Voter was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /voters/1 or /voters/1.json
  def destroy
    @voter.destroy
    redirect_to election_path(@voter.election_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voter
      @voter = Voter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voter_params
      params.require(:voter).permit(:election_id, :user_id, :candidate_id)
    end
end
