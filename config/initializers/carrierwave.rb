CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAJYRWYDU3OSUJ3O6Q',                        # required
      aws_secret_access_key: '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',                        # required
      region:                'eu-central-1',                  # optional, defaults to 'us-east-1'
      host:                  's3.amazonaws.com',
      endpoint:              'https://akp-' + Rails.env + '.s3.amazonaws.com/'
  }
  config.fog_directory  = 'akp-' + Rails.env                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end