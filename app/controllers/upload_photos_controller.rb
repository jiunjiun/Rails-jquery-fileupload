class UploadPhotosController < ApplicationController
  before_action :set_upload_photo, only: [:show, :edit, :update, :destroy]

  # GET /upload_photos
  # GET /upload_photos.json
  def index
    @upload_photos = UploadPhoto.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /upload_photos/1
  # GET /upload_photos/1.json
  def show
  end

  # GET /upload_photos/new
  def new
    @upload_photo = UploadPhoto.new
  end

  # GET /upload_photos/1/edit
  def edit
  end

  # POST /upload_photos
  # POST /upload_photos.json
  def create
    @upload_photo = UploadPhoto.new(upload_photo_params)

    respond_to do |format|
      if @upload_photo.save
        format.html { redirect_to @upload_photo, notice: 'Upload photo was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @upload_photo }
        format.json { render json: {files: [@upload_photo.to_jq_upload]}, status: :created, location: @upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @upload_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upload_photos/1
  # PATCH/PUT /upload_photos/1.json
  def update
    respond_to do |format|
      if @upload_photo.update(upload_photo_params)
        format.html { redirect_to @upload_photo, notice: 'Upload photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upload_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_photos/1
  # DELETE /upload_photos/1.json
  def destroy
    @upload_photo.destroy
    respond_to do |format|
      format.html { redirect_to upload_photos_url }
      format.json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_photo
      @upload_photo = UploadPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_photo_params
      params.require(:upload_photo).permit(:name, :file, :size, :content_type)
    end
end
