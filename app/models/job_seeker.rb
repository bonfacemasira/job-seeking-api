class JobSeeker < ApplicationRecord
    has_one_attached :cv
    has_one_attached :image
    has_one_attached :certificate
    # has_one_attached :experience
    has_one_attached :passport
    validate :correct_document_mime_type

    private
  
    def correct_document_mime_type
      if document.attached? && !document.content_type.in?(%w(application/msword application/pdf))
        errors.add(:document, 'Must be a PDF or a DOC file')
      end
    end
end
