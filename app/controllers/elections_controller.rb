class ElectionsController < ApplicationController
  before_action :set_election, only: %i[ show edit update destroy toggle_election_statut delete_vote end_election ]

  # GET /elections or /elections.json
  def index
    @elections = Election.all
  end

  # GET /elections/1 or /elections/1.json
  def show
    @candidates = @election.candidates
    @voters = Voter.where(election_id: @election.id).select(:user_id).distinct
    @winners = Voter.where(election_id: @election.id).group(:candidate_id).count(:candidate_id)

    # check number of candidates result
    if @election.end
        @first = Candidate.find(@winners.sort_by{|k, v| v}.reverse.first[0].to_i)
        @first_result = @winners.sort_by{|k, v| v}.reverse.first[1].to_i
        
        if @winners.count === 2
            @second = Candidate.find(@winners.sort_by{|k, v| v}.reverse.second[0].to_i)
            @second_result = @winners.sort_by{|k, v| v}.reverse.second[1].to_i
        end
        
        if @winners.count === 3
            @third = Candidate.find(@winners.sort_by{|k, v| v}.reverse.third[0].to_i)
            @third_result = @winners.sort_by{|k, v| v}.reverse.third[1].to_i
        end
        
        if @winners.count >= 4
            @third = Candidate.find(@winners.sort_by{|k, v| v}.reverse.third[0].to_i)
            @third_result = @winners.sort_by{|k, v| v}.reverse.third[1].to_i
            @fourth = Candidate.find(@winners.sort_by{|k, v| v}.reverse.fourth[0].to_i)
            @fourth_result = @winners.sort_by{|k, v| v}.reverse.fourth[1].to_i
        end

    end
 

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
    @election.user_id = current_user.id

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

  def toggle_election_statut
      if @election.started == FALSE
        @election.started = TRUE
        @election.save
        redirect_to @election
    else
        @election.started = FALSE
        @election.save
        redirect_to @election
      end
  end

  def end_election
    @election.end = TRUE
    @election.save
    redirect_to @election
  end

  def delete_vote
    @voters = @election.voters
    @voters.each do |vote|
        vote.destroy
    end
    @election.started = FALSE
    @election.save
    redirect_to @election    
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
