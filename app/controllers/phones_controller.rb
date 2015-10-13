class PhonesController < ApplicationController
	respond_to :html, :json

	def index
		if current_user.present?
			@phones = Phone.where(status: "in-stock")
			respond_to do |format|
		        format.html {  }
		        format.json {  render json: @phones}  
		    end
		  else
		  	redirect_to new_user_session_path, :notice=>"Please login first"
		  end
	end

	def new
		if current_user.present?
			@phone = Phone.new
			# 3.times { @phone.photos.build }
		else
			redirect_to new_user_session_path, :notice=>"Please login first"
		end
	end

	def create
		@phone = Phone.new(params[:phone])
		@phone.status = "in-stock"
		if @phone.save
			# @photo = @phone.photos.build(params[:phone][:photos_attributes][0])
			# @photo.save
			redirect_to phones_path, notice: 'Successfully saved.'
		end
	end

	def show
		@phone = Phone.find(params[:id])
	end

	def edit
		@phone = Phone.find params[:id]
	end

	def update
		puts "---"*90
		puts params
		@phone = Phone.find(params[:id])
    	flash[:notice] = 'phone was successfully updated.' if @phone.update_attributes(params[:phone])
    	redirect_to phones_path, notice: 'Successfully saved.'    	
    	# respond_with @invitation
	end

	def sold_out
	  @phone = Phone.find(params[:id])
	  @phone.status = "sold"
	  @phone.update_attributes(params[:phone])
	  redirect_to phones_path, notice: 'Successfully sold.'
	end

	def sold
		@phone = Phone.find params[:id]
		respond_to do |format|
      format.html {  }
      format.json {  render json: @phones}  
    end
	end

	def return
		@phone = Phone.find params[:id]
		@phone.status = "in-stock"
		@phone.save!
		@phones  =Phone.where(status: "in-stock")
    	# redirect_to soldOut_phones_path, notice: 'Successfully saved.'
		respond_to do |format|
	        format.html { redirect_to soldOut_phones_path, notice: 'successfully sold.' }
	        format.json {  render json: @phones}  
	    end
	end

	def soldOut
		@phones = Phone.where(status: "sold")
		respond_to do |format|
	        format.html {}
	        format.json {  render json: @phones}  
	    end
	end

	def destroy
    @phones = Phone.find(params[:id])
    if @phones.destroy
      flash[:notice] = 'Phone was successfully destroy.'
      redirect_to phones_path
    end
  end

end
