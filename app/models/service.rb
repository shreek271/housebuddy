class Service < ActiveRecord::Base

	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
    validate  :photo_size

    mount_uploader :photo, PhotoUploader

    private

    # Validates the size of an uploaded picture.
    def photo_size
      if photo.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
