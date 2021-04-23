Airbrake.configure do |config|
    config.api_key = '0af8f8609741df9bfcb732b245c5a55c'
    config.host    = 'errbit.hut.shefcompsci.org.uk'
    config.port    = 443
    config.secure  = config.port == 443
end