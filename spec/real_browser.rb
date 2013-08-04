module RealBrowser
	def self.included base
		base.before :each do
			Capybara.register_driver :poltergeist do |app|
			  Capybara::Poltergeist::Driver.new(app, :inspector => true)
			end
			Capybara.current_driver = :poltergeist
			Capybara.default_host = "localhost"
  		Capybara.app_host = "http://localhost:3001"
		end		
	end

	def take_screenshot
		page.save_screenshot("screen.png")
		`open screen.png` if `uname`.match "Darwin"
		# TODO: Make something for linux
		"Screenshot taken to screen.png"
	end

	def wait_until
	  require "timeout"
	  Timeout.timeout(Capybara.default_wait_time) do
	    sleep(0.1) until value = yield
	    value
	  end
	end
end