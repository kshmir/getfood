class DeliveryController < ApplicationController
	before_filter :find_delivery, except: [:index, :new, :create]

	def index
		@deliverys = Delivery.all
	end

	def show
	end

	def new
		@delivery = Delivery.new
	end

	def edit
	end

	def create
		@delivery = Delivery.new(params[:delivery])
		if @delivery.save
		  flash[:success] = "Delivery successfully created"
		  redirect_to @delivery
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end

	def update
		if @delivery.update_attributes(params[:delivery])
		  flash[:success] = "Delivery was successfully updated"
		  redirect_to @delivery
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end

	def destroy
		if @delivery.destroy
			flash[:success] = "Delivery was successfully deleted"
			redirect_to delivery_index_path
		else
			flash[:error] = "Something went wrong"
			redirect_to delivery_index_path
		end
	end

	private

		def find_delivery
			@delivery = Delivery.find(params[:id])
		end

end