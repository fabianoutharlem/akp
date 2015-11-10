CarrierWave.configure do |config|

  config.root "#{Rails.root}/tmp/"
  config.s3_access_key_id = 'AKIAJYRWYDU3OSUJ3O6Q'
  config.s3_secret_access_key = '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'
  config.s3_bucket = 'akp-' + Rails.env

end