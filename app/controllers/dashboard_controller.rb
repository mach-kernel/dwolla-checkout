require 'dwolla'

class DashboardController < ApplicationController

	# Generally, it is best to handle errors in every function for every case,
	# however, given that this is a toy application and we will only throw API errors,
	# it is ok to do this.
	rescue_from Dwolla::DwollaError, :with => :rescue_dwolla_errors

	def rescue_dwolla_errors(exception)
		reset_session if exception.message == "Expired access token." or exception.message == "Invalid access token."

		if exception.message != "Expired access token." or exception.message != "Invalid access token."
			flash[:error] = "Uh oh! A Dwolla API error was encountered: \n#{exception.message}"
			redirect_to '/'
		else
			flash[:error] = "An authentication error was encountered and you were logged out. Try again?"
			redirect_to '/'
		end
	end

	def is_email?(str)
		str =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	end

	def step1
		if not_configured?
			render 'notconf'
		else
			@pojson = "```js 
{
  \"purchaseOrder\": {
    \"total\": \"#{DwollaVars.thing_price + DwollaVars.shipping}\",
    \"destinationId\": \"#{DwollaVars.destinationId}\",
    \"customerInfo\": {
    \"firstName\": \"\",
    \"lastName\": \"\",
    \"email\": \"\",
    \"city\": \"\",
    \"state\": \"\",
    \"zip\": \"\"
    }
  }
} \n```"
		end
	end

	def do_checkout
		if not_configured?
			render 'notconf'
		elsif params[:commit] == "Process Checkout"
			DwollaVars.Dwolla::OffsiteGateway.clear_session
			DwollaVars.Dwolla::OffsiteGateway.set_customer_info(*params[:payment].values)
			DwollaVars.Dwolla::OffsiteGateway.add_product('Thingamadoodaddle', 'Specific doodad description', DwollaVars.thing_price + DwollaVars.shipping, 1)

			redirect_to(DwollaVars.Dwolla::OffsiteGateway.get_checkout_url(DwollaVars.destinationId))
			
		else
			flash[:error] = "Something went wrong. Try again?"
			redirect_to '/'
		end
	end

end