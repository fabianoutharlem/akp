class CmsField < ActiveRecord::Base

  mount_uploader :home_foto_1, CmsFieldUploader
  mount_uploader :home_foto_2, CmsFieldUploader
  mount_uploader :home_foto_3, CmsFieldUploader
  mount_uploader :service_bg, CmsFieldUploader

end
