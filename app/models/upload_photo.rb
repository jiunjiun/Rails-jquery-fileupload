class UploadPhoto < ActiveRecord::Base

    mount_uploader :file, PhotoUploader

    include Rails.application.routes.url_helpers
    def to_jq_upload
        {
          "name"        => read_attribute(:name),
          "size"        => read_attribute(:size),
          "url"         => self.file_url(),
          "small_url"   => self.file_url(:small),
          "delete_url"  => upload_photo_path(self),
          "delete_type" => "DELETE"
        }
    end

    before_save :update_banner_attributes

    private

    def update_banner_attributes
        if file.present? && file_changed?
            self.name         = file.file.filename
            self.size         = file.file.size
            self.content_type = file.file.content_type
        end
    end
end
