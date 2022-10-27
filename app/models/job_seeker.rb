class JobSeeker < ApplicationRecord
    has_one_attached :cv
    has_many_attached :image
    has_many_attached :certificates
    has_many_attached :experience
end
