namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_blogs
		make_relationships
		make_comments
	end
end

def make_users
	admin = User.create!(name: "Example User",
			     email: "example@railstutorial.org",
			     password: "foobar",
			     password_confirmation: "foobar",
			     admin: true)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(name: name,
			     email: email,
			     password: password,
			     password_confirmation: password)
	end
end

def make_blogs
	users = User.all(limit: 6)
	50.times do
		title = Faker::Lorem.sentence(10)
		content = Faker::Lorem.sentence(15)
		users.each { |user| user.blogs.create!(title: title,content: content) }
	end
end

def make_relationships
	users = User.all
	user = users.first
	followed_users	= users[2..50]
	followers	= users[3..40]
	followed_users.each { |followed| user.follow!(followed) }
	followers.each	    { |follower| follower.follow!(user) }
end

def make_comments
		blogs = Blog.all
		blog = blogs.first
		user = User.first
		body = Faker::Lorem.sentence(15)
		50.times do
				blog.comments.create(body: body, user_id: user.id)
		end
end
