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
		form_params = parse_form_params(params[:delivery_call])
		@delivery_call = DeliveryCall.new(form_params["delivery_call"])
		request = DeliveryRequest.new(user: current_user, menus: [form_params["menu"]])
		@delivery_call.delivery_requests << request
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

	def parse_form_params params
		hours = params["delivery_time"].split(":").first
		minutes = params["delivery_time"].split(":").last
		delivery_time = DateTime.now.change({:hour => hours.to_i , :min => minutes.to_i , :sec => 0 })
		form_params = {}
		form_params["delivery_call"] = {"delivery_time" => delivery_time}
		menu = Menu.find(params["delivery_id"].to_i)
		form_params["menu"] = menu
		form_params["delivery_call"]["delivery_id"] = menu.delivery_id
		form_params
	end

end
