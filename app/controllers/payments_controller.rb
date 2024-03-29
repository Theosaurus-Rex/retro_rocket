class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    # Action for successful payment route
    def success
    end

    # Update listing status to "sold: true" when purchased.
    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id
    
        listing = Listing.find(listing_id.to_i)
        listing.sold = true
        listing.save
    
        status 200
    end
end