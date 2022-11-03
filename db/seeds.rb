# Employer.create(phone_number: "09672346", organization:"Safaricom", user_id:1)
# Employer.create(phone_number: "32456788", organization:"Facebook", user_id:2)
# Employer.create(phone_number: "257976544", organization:"Microsoft", user_id:3)
# Employer.create(phone_number: "345678234", organization:"Google", user_id:2)
# Employer.create(phone_number: "135790314", organization:"Tesla", user_id:1)

User.create(username: "phinic", password: "phinic", email: "phinic@gmail.com", password_confirmation:"phinic" , role:0)
User.create(username: "nyangate", password: "nyangate", email: "nyangate@gmail.com", password_confirmation:"nyangate" , role:2)
User.create(username: "nyangate", password: "nyangate", email: "ogeto@gmail.com", password_confirmation:"ogeto" , role:1)
User.create(username: "nyachuba", password: "nyachuba", email: "ogeto@gmail.com", password_confirmation:"ogeto" , role:1)

# Offer.create(name:"Microsoft", job_title:"Front-end", employer_id:1, user_id:2, job_seeker_id:2, image:"https://image.shutterstock.com/image-photo/kiev-ukraine-march-8-2015-260nw-272871062.jpg")
# Offer.create(name:"Safaricom", job_title:"UI/UX", employer_id:2, user_id:1, job_seeker_id:4, image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzgSqruZBYzsgHX6UsJwwJcmqL9tI69t9qhzBfhEkj&s")
# Offer.create(name:"Andela", job_title:"Backend", employer_id:3, user_id:2, job_seeker_id:3, image:"https://media.istockphoto.com/photos/butterfly-picture-id1290360051?k=20&m=1290360051&s=612x612&w=0&h=If5LpQZMCQf_JBmvoeU8TG9rhqWwP-ukk-FDfCzE7U4=")
# Offer.create(name:"Zuri", job_title:"Full-stack", employer_id:1, user_id:3, job_seeker_id:2, image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSD-ezxNSjEeeyJKFcFN92CpV79oOnyqJWh0B4ErSwDcA&s")
# Offer.create(name:"Telkom", job_title:"product manager", employer_id:1, user_id:4, job_seeker_id:1, image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn6z9sV8ZFkvg0RZ9RAD1pA9cbaNUb62buswEq7lAitg&s")
# Offer.create(name:"Airtel", job_title:"Devops", employer_id:1, user_id:3, job_seeker_id:5, image:"https://upload.wikimedia.org/wikipedia/en/thumb/1/18/Airtel_logo.svg/1200px-Airtel_logo.svg.png")

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
