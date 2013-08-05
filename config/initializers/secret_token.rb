# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token 
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use existing token 
    File.read(token_file).chomp
  else 
    #generate new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = '4f69dc85a32157860bac5feab5f5048a5151779f881d864b5a87cc70ed440b801b30e9f1231201a87c46f0744a98991d88b2b8643dbee2619210656aa3327799'
