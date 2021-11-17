# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Recommended Browser
- [Google Chrome](https://www.google.com/chrome/)
## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* More package dependencies : https://github.com/smplsoln/junglerails/blob/master/Gemfile


## Application Screenshots

- !["1_Jungle_root.png"](https://github.com/smplsoln/junglerails/blob/master/docs/1_Jungle_root.png)
- !["2_Sold_Out.png"](https://github.com/smplsoln/junglerails/blob/master/docs/2_Sold_Out.png)
- !["3_Admin_category_created.png"](https://github.com/smplsoln/junglerails/blob/master/docs/3_Admin_category_created.png)
- !["4_Admin_new_Product_of_new_category_added.png"](https://github.com/smplsoln/junglerails/blob/master/docs/4_Admin_new_Product_of_new_category_added.png)
- !["5_New_user_Signuped_and_Loggedin.png"](https://github.com/smplsoln/junglerails/blob/master/docs/5_New_user_Signuped_and_Loggedin.png)
- !["6_logged_out_redirected_to_login.png"](https://github.com/smplsoln/junglerails/blob/master/docs/6_logged_out_redirected_to_login.png)
- !["7_try_existing_email_signup.png"](https://github.com/smplsoln/junglerails/blob/master/docs/7_try_existing_email_signup.png)
- !["8_existing_email_signup_rejected_with_msg_on_redirected_signup_page.png"](https://github.com/smplsoln/junglerails/blob/master/docs/8_existing_email_signup_rejected_with_msg_on_redirected_signup_page.png)
- !["9_Hashed_password_digest_stored.png"](https://github.com/smplsoln/junglerails/blob/master/docs/9_Hashed_password_digest_stored.png)
- !["10_My_cart_details_page_enhancements.png"](https://github.com/smplsoln/junglerails/blob/master/docs/10_My_cart_details_page_enhancements.png10_My_cart_details_page_enhancements.png)
- !["11_Enhanced_Order_details_page.png"](https://github.com/smplsoln/junglerails/blob/master/docs/11_Enhanced_Order_details_page.png11_Enhanced_Order_details_page.png)
- !["12_empty_cart__page_msg_ith_back_link.png"](https://github.com/smplsoln/junglerails/blob/master/docs/12_empty_cart__page_msg_ith_back_link.png)