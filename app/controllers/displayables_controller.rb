class DisplayablesController < ApplicationController
  before_action :set_displayable, only: %i[ show edit update destroy ]

  # GET /displayables or /displayables.json
  def index
    @displayables = Displayable.all
  end

  # GET /displayables/1 or /displayables/1.json
  def show
  end

  # GET /displayables/new
  def new
    @displayable = Displayable.new
  end

  # GET /displayables/1/edit
  def edit
  end

  # POST /displayables or /displayables.json
  def create
    @displayable = Displayable.new(displayable_params)

    respond_to do |format|
      if @displayable.save
        format.html { redirect_to displayable_url(@displayable), notice: "Displayable was successfully created." }
        format.json { render :show, status: :created, location: @displayable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @displayable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /displayables/1 or /displayables/1.json
  def update
    respond_to do |format|
      if @displayable.update(displayable_params)
        format.html { redirect_to displayable_url(@displayable), notice: "Displayable was successfully updated." }
        format.json { render :show, status: :ok, location: @displayable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @displayable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /displayables/1 or /displayables/1.json
  def destroy
    @displayable.destroy

    respond_to do |format|
      format.html { redirect_to displayables_url, notice: "Displayable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_displayable
      @displayable = Displayable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def displayable_params
      params.require(:displayable).permit(:name, :color, :flatshading, :file, :material)
    end
end
