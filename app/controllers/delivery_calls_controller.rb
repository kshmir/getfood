class DeliveryCallsController <  InheritedResources::Base

	def show
		@delivery_call = DeliveryCall.find(params[:id])
		@menus = @delivery_call.delivery.menus
	end

  
  def index
    super
  end

  def update
    super
  end

  def create
    super
  end

  def destroy
    super
  end
end