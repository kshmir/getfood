require 'zeus/rails'

class CustomPlan < Zeus::Rails
  def test
    require 'simplecov'
    SimpleCov.start 'rails' do
		  add_filter '/spec/'
		  add_filter '/test/'
		  add_filter '/config/'

		  add_group 'Controllers', 'app/controllers'
		  add_group 'Models', 'app/models'
		  add_group 'Libraries', 'lib'
		end
    # require all ruby files
    Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }

    # run the tests
    super
  end
end
 
Zeus.plan = CustomPlan.new
Zeus.plan = CustomPlan.new

def notifier
   return (`uname`).match("Darwin") ? "terminal_notifier" : "libnotify" 
end

ENV['GUARD_NOTIFY'] = 'true'
ENV['GUARD_NOTIFICATIONS'] = "---\n- :name: :#{notifier}\n  :options: {}\n"
