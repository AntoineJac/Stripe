# require Stripe's Ruby bindings
require 'stripe'

# set your secret API key. You should generally store this in an evironment variable.
Stripe.api_key = "sk_your_key"

# grab the first 100 charges
charges = Stripe::Charge.list(limit: 100)

# print the charge ID for each
charges.each do |charge|
  puts charge.id
end

# if there are more than 100 charges, paginate through each set of 100
while charges.has_more do 
  charges = Stripe::Charge.list(limit: 100, starting_after: charges.data.last.id)
  
  charges.each do |charge|
    puts charge.id
  end
end
