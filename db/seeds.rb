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

{
  "Category 1" => ["Subcategory11", 'Subcategory22'],
  "Category 2" => ["Subcategory21", 'Subcategory22', 'Subcategory23'],
  "Category 3" => [],
}.each do |cat, subs|
  c = Category.create!(name: cat)
  subs.each { |s| Category.create!(name: s).move_to_child_of(c) }
end

count = Category.all.size

tags = Array.new(10) { Faker::Lorem.word }

# create Posts
10.times do
  post = admin.posts.create(
    title: Faker::Lorem.sentence(rand(3..6)),
    content: Faker::Lorem.paragraph(rand(30..60)),
    tag_list: Array.new(rand(2..6)) { tags.sample }
  )
  post.category = Category.offset(rand(count)).first
  post.save!
end
