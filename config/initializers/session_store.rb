# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sample_social_network_session',
  :secret      => '6664463224a21b7f4d9c7a35e436faa95deb79f6552f8952113fed9ac417505bd37b72bd6847bbf467c8c019e90267b5f75baeb6bb30700be0444a0475528708'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
