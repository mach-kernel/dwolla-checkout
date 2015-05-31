require 'dwolla'

module DwollaVars
	mattr_reader  :Dwolla, :pin, :thing_price, :shipping, :destinationId, :redirect

	@@Dwolla ||= Dwolla
	
	@@Dwolla::api_key ||= "Gt2311eWuGPiR3+ZMDavMEuQrZR723a8vt7Hipt3PIPulD1X43"
	@@Dwolla::api_secret ||= "yfMN9K+NEFbmBcYBQQPqNdO5N6OeC4a3eVn4UnIq15LsRtkww/"

	@@Dwolla::sandbox ||= true

	# This is due to laziness. Please use a shopping cart
	# plugin in production. This is just illustrative. I swear.
	@@thing_price = 45.00
	@@shipping = 5.00
	@@destinationId = "812-124-7074"
	@@redirect = "http://localhost:3000/dashboard/complete_checkout"

end