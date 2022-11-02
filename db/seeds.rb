# Employer.create(phone_number: "09672346", organization:"Safaricom", user_id:1)
# Employer.create(phone_number: "32456788", organization:"Facebook", user_id:2)
# Employer.create(phone_number: "257976544", organization:"Microsoft", user_id:3)
# Employer.create(phone_number: "345678234", organization:"Google", user_id:2)
# Employer.create(phone_number: "135790314", organization:"Tesla", user_id:1)

User.create(username: "phinic", password: "phinic", email: "phinic@gmail.com", password_confirmation:"phinic" , role:0)
User.create(username: "nyangate", password: "nyangate", email: "nyangate@gmail.com", password_confirmation:"nyangate" , role:2)
User.create(username: "nyangate", password: "nyangate", email: "ogeto@gmail.com", password_confirmation:"ogeto" , role:1)

# pdf = File.new(Rails.root.join("sample_pdfs/primary.pdf"))
# pdf = File.open('/home/access/Music/primary.pdf')

# pdf = File.open(Dir['sample_pdfs/*.pdf'].first)
# pdf = Rack::Test::UploadedFile.new()
# puts "put #{pdf}"
10.times do
new_jobseeker = JobSeeker.create(
full_name:Faker::Name.unique.name,
country:Faker::Address.country,
job_type:Faker::Lorem.sentence,
salary_expectation:rand(5000..18000),
skills: Faker::Hobby.activity,
availability:Faker::Boolean.boolean,
experience:rand(1..12),
# passport: "",
# image:'',
# certificate:""
# cv:pdf
)

new_jobseeker.cv.attach(io: File.open(File.join(Rails.root, 'sample_pdfs/primary.pdf')),filename:"primary.pdf",content_type:"application/pdf")
new_jobseeker.certificate.attach(io: File.open(File.join(Rails.root, 'sample_pdfs/primary.pdf')),filename:"primary.pdf",content_type:"application/pdf")
new_jobseeker.image.attach(io: File.open(File.join(Rails.root, 'sample_pdfs/primary.pdf')),filename:"primary.pdf",content_type:"application/pdf")
new_jobseeker.passport.attach(io: File.open(File.join(Rails.root, 'sample_pdfs/primary.pdf')),filename:"primary.pdf",content_type:"application/pdf")
end

