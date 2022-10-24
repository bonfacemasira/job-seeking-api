class JobSeeker < ApplicationRecord
    has_one_attached :cv
    has_many_attached :certificates
end
