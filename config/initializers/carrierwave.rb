CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAJYRWYDU3OSUJ3O6Q',                        # required
      aws_secret_access_key: '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',                        # required
      region:                'eu-central-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'akp-' + Rails.env                          # required
end