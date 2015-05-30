require 'dwolla'

module DwollaVars
	mattr_reader  :Dwolla, :pin, :thing_price, :shipping, :destinationId

	@@Dwolla ||= Dwolla
	
	@@Dwolla::api_key ||= "Gt2311eWuGPiR3+ZMDavMEuQrZR723a8vt7Hipt3PIPulD1X43"
	@@Dwolla::api_secret ||= "yfMN9K+NEFbmBcYBQQPqNdO5N6OeC4a3eVn4UnIq15LsRtkww/"

	@@Dwolla::token ||= "BxrMxKgRkWK7oloTplguEcjTVDjoW5dGS+Wd5GkS5w4CaJlL3Y"
	@@pin ||= 1337

	@@Dwolla::sandbox ||= true

	# This is due to laziness. Please use a shopping cart
	# plugin in production. This is just illustrative. I swear.
	@@thing_price = 450.00
	@@shipping = 100.00
	@@destinationId = "812-111-7219"

end