class PaymentsController < ApplicationController
    def success
    end

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