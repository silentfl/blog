# create Users
[
  'admin@example.com',
  'bob@example.com',
  'alice@example.com'
].each { |email| User.create!(email: email, password: '12345678') }

# set Admin user
admin = User.find_by_email('admin@example.com')
admin.update_attribute(:admin, true)
admin.save!

tags = Array.new(10) { Faker::Lorem.word }

# create Posts
10.times do
  admin.posts.create!(
    title: Faker::Lorem.sentence(rand(3..6)),
    content: Faker::Lorem.paragraph(rand(30..60)),
    tag_list: Array.new(rand(2..6)) { tags.sample }
  )
end
