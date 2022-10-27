class JobSeekerSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :country, :passport, :image, :job_type,:salary_expectation, :cv,:skills, :user_id, :availability,  :certificate, :experience
#  has_one :user
  end
  def passport
    rails_blob_path(object.passport,only_path: true) if object.passport.attached?
  end
  def image
    rails_blob_path(object.image,only_path: true) if object.image.attached?
  end
  def cv
    rails_blob_path(object.cv,only_path: true) if object.cv.attached?
  end
  def certificate
    rails_blob_path(object.certificate,only_path: true) if object.certificate.attached?
  end
      
  end