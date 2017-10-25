class ChargesController < ApplicationController
  before_action :set_item
  def new
  end

  def create

  # Amount in cents
  @item = Item.find(params[:id])
  @amount = (@item.price.to_i) *100



#checking if the current user has a stripe id and if not creating one in our own dtabase

  # if current_user.stripeid.present?
  #   customer = Stripe::Customer.id
  # else
   customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )
   current_user.stripeid = customer.id
   current_user.save()

   charge = Stripe::Charge.create(
     :amount => @amount, # $15.00 this time
     :currency => 'aud',
     :customer => customer.id,
)

    @transaction = Transaction.create(user_id: current_user.id, item_id: @item.id, price: @amount, stripe_transaction_id: charge.id)
    @transaction.save

    # charge = Stripe::Charge.retrieve(
    # :charge => charge.id,
    # :amount => @amount,
    # :currency => 'aud'
    # )



    # charge = Stripe::Charge.create(
    # :amount => 1500, # $15.00 this time
    # :currency => "aud",
    # :customer => stripeid, # Previously stored, then retrieved

  #
  # )

  redirect_to root_path

#we're backing up that stripe charges on our local database

  # @charge = Charge.new(price: @amount)
  # @charge.user = current_user
  # @charge.stripe_token = charge.id

  # if @charge.save
  #   redirect_to charge_path(@charge)
  # else
  #   redirect_to item_path(@item)
  # end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end




  private
  def set_item
    @item = Item.find(params[:id])
  end

end
