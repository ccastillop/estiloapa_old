# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_estiloapa_session',
  :secret      => 'cc3d1bc0b7fb66360b6c8bc17b6d3007cb72a01a51bd39e231b41034b8345f0f04c251a2c09517d984defc1581b38c6692300957940d0f4591a7d2f9a1b61beb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
