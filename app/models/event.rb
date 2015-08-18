class Event < ActiveRecord::Base
  # attr_accessor :user_id, :name, :image, :remote_image_url, :video, :remote_video_url, :user
  belongs_to :user
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  validate :file_size

  def file_size
    if video.file.size.to_f/(1000*1000) > 41943040
      errors.add(:file, "You cannot upload a file greater than 40MB")
      format.html { render :new }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  geocoded_by :address   # can also be an IP address
  after_validation :geocode 
  

end
