class CoversController < ApplicationController
  layout 'admin'   
  before_action :set_cover, only: [:show, :edit, :update, :destroy]

  # GET /covers
  # GET /covers.json
  def index
    @covers = Cover.all
  end

  # GET /covers/1
  # GET /covers/1.json
  def show
  end

  # GET /covers/new
  def new
    @devices = Device.all
    @cover = Cover.new
  end

  # GET /covers/1/edit
  def edit
  end

  # POST /covers
  # POST /covers.json
  def create
   
    coverImages = params['cover']['images'];
 
    for i in 0..coverImages.length - 1
      uploaded_io = coverImages[i]
      random_token = SecureRandom.urlsafe_base64(nil, false)
      ext = uploaded_io.content_type.split("/")[1]
      uploaded_io = coverImages[i]
      File.open(Rails.root.join('public', 'uploads', 
        random_token + "."+ext), 'wb') do |file|
        file.write(uploaded_io.read)
      end 
    end    
    #render :inline => "hello<%= params['cover']['images'][0].original_filename %>"
    
  end

  # PATCH/PUT /covers/1
  # PATCH/PUT /covers/1.json
  def update
    respond_to do |format|
      if @cover.update(cover_params)
        format.html { redirect_to @cover, notice: 'Cover was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covers/1
  # DELETE /covers/1.json
  def destroy
    @cover.destroy
    respond_to do |format|
      format.html { redirect_to covers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @cover = Cover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_params
      params.require(:cover).permit(:name, :desc, :price, :device)
    end
end
