# Candy Store

This is a rails application using the stripe api gem for payment on a marketplace model ie a candy store

### System Requirements

* Ruby version

    2.4.0

* Rails Version

    5.1.4

### System dependencies

#### Gems installed

```
gem 'dotenv-rails', groups: [:development, :test]
#for secret key upload

gem 'stripe'
#payment api

gem "shrine"
#image upload

gem 'devise'
#user authentication
```

### Database creation

* During this process, it was derived that storing stripe information under the charge controller with rails wasn't working, which meant creating a different controller to save the stripe token information locally which is named here *Transactions*

### Improvements going forward

* User flow - currently a user is able to upload and pay for their own item *(NOTE: this was for testing purposes only to ensure that the stripe payment would successfully go through into the stripe dashboard as test data)*

* Design - Duplicate id messages for signing in and creating a product need to be removed. *(NOTE: actioned 14/11)*

* Transaction page- needs styling with bootstrap.

### Summary
This initial test was a success for more information on the charge set up please find the documentation below:

#### Stripe for Rails Checkout
Stripe guide for rails click [here](https://stripe.com/docs/checkout/rails).
