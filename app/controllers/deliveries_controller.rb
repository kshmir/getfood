class DeliveriesController <  InheritedResources::Base

	def show
		@delivery = Delivery.find(params[:id])
		@menus = @delivery.menus
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
