namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do 
		User.create!(name: "Example User",
					 email: "example@railstutorial.org",
					 password: "111111",
					 password_confirmation: "111111")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end

		users = User.all(limit: 6)
		50.times do |n|
			title = Faker::Lorem.sentence(2)
			if n<=25
				users.each {|user| user.posts.create!(title: title, link:"www.sina.com.cn", content: Faker::Lorem.sentence(5))}
			else
				users.each {|user| user.posts.create!(title:title, link:"www.sina.com.cn")}
			end
		end
	end
end