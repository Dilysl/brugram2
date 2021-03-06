class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id]) #copied this..what does params mean? How does ruby know to grab the corresponding spot in the array? Is :id related to the end of the url somehow?
	end

	def new
		@photo = Photo.new
	end

	def edit
		@photo =Photo.find(params[:id])
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to @photo
		else
			render :new
		end
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update(photo_params)
			redirect_to @photo
		else
			render :edit
		end
	end

	def destroy
		@photo = Photo.find(params[:id])

		@photo.destroy
		redirect_to photos_path
	end

	def like
	    @photo = Photo.find(params[:id])
	    @photo.liked!
	    @photo.save
	    
	    redirect_to photo_path(@photo)
	end

	private 
		def photo_params
			params.require(:photo).permit(:caption, :image)
		end
end
