class DeliveryCallsController < ApplicationController
	before_filter :find_delivery_call, except: [:index, :new, :create]

	def index
		@delivery_calls = DeliveryCall.all
	end

	def show
	end

	def new
		@delivery_call = DeliveryCall.new
	end

	def edit
	end

	def create
		@delivery_call = User.new(params[:delivery_call])
		if @delivery_call.save
			flash[:success] = "DeliveryCall successfully created"
			redirect_to @delivery_call
		else
			flash[:error] = "Something went wrong"
			render 'new'
		end
	end

	def update
		if @delivery_call.update_attributes(params[:delivery_call])
			flash[:success] = "DeliveryCall was successfully updated"
			redirect_to @delivery_call
		else
			flash[:error] = "Something went wrong"
			render 'edit'
		end
	end

	def destroy
		if @delivery_call.destroy
			flash[:success] = "DeliveryCall was successfully deleted"
			redirect_to @delivery_calls_url
		else
			flash[:error] = "Something went wrong"
			redirect_to @delivery_calls_url
		end
	end

	private

	def find_delivery_call
		@delivery_call = DeliveryCall.find(params[:id])
	end
end
