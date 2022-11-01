class JobSeeker < ApplicationRecord
    has_one_attached :cv
    has_one_attached :image
    has_one_attached :certificate
    has_one_attached :passport
    # validate :correct_document_mime_type

      def passport_url
    Rails.application.routes.url_helpers.url_for(passport) if passport.attached?
  end

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

  def cv_url
    Rails.application.routes.url_helpers.url_for(cv) if cv.attached?
  end

  def certificate_url
    Rails.application.routes.url_helpers.url_for(certificate) if certificate.attached?
  end
      
    private
  
    # def correct_document_mime_type
    #   if JobSeeker.new.cv.attached? && !JobSeeker.new.cv.content_type.in?(%w(application/msword application/pdf))
    #     errors.add(:document, 'Must be a PDF or a DOC file')
    #   end
    # end
end
