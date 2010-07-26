# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_poetry_board_demo_session',
  :secret      => '56291dae70446ce74ba3271927caa38401a25e33874bdb820391fd4d18a43288caae0e52aa0fbe0df5941648eb40d3b58c95575af59b380989be4a7f9b882620'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
