class PhonesController < ApplicationController
	respond_to :html, :json

	def index
		@phones = Phone.where(status: "in-stock")
		respond_to do |format|
	        format.html {  }
	        format.json {  render json: @phones}  
	    end
	end

	def new
		@phone = Phone.new
	end

	def create
		@phone = Phone.new(params[:phone])
		@phone.status = "in-stock"
		if @phone.save
			redirect_to phones_path, notice: 'Successfully saved.'
		end
	end

	def edit
		@phone = Phone.find params[:id]
	end

	def update
		@phone = Phone.find(params[:id])
    	flash[:notice] = 'phone was successfully updated.' if @phone.update_attributes(params[:phone])
    	redirect_to phones_path, notice: 'Successfully saved.'    	
    	# respond_with @invitation
	end

	def sold
		@phone = Phone.find params[:id]
		@phone.status = "sold"
		@phone.save!
		@phones  =Phone.where(status: "sold")
    	# redirect_to phones_path, notice: 'Successfully saved.'
		respond_to do |format|
	        format.html { redirect_to phones_path, notice: 'successfully sold.' }
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
	end

end
