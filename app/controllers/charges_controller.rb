class ChargesController < ApplicationController

  def new
  end

  def create
  # Amount in cents
  @amount = @item.price



#checking if the current user has a stripe id and if not creating one in our own dtabase

  if current_user.stripeid.present?
    customer = Stripe::Customer.id
  else
   customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )
   current_user.stripeid = customer.id
   current_user.save()
  end

  stripe_charge = Stripe::Charge.create(
    :customer    => current_user.stripeid,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'aud'
  )

  # redirect_to charge_path

#we're backing up that stripe charges on our local database

  # @charge = Charge.new(price: @amount)
  # @charge.user = current_user
  # @charge.stripe_token = charge.id

  if @charge.save
    redirect_to charge_path(@charge)
  else
    redirect_to item_path(@item)
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end




end
