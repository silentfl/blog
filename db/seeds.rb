# create Users
[
  { name: 'admin', email: 'admin@example.com' },
  { name: 'bob', email: 'bob@example.com' },
  { name: 'alice', email: 'alice@example.com' }
].each do |user|
  User.create!(name: user[:name], email: user[:email], password: '12345678')
end

# set Admin user
admin = User.find_by_email('admin@example.com')
admin.update_attribute(:admin, true)
admin.save!
count_users = User.all.size

{
  "Category 1" => ["Subcategory11", 'Subcategory22'],
  "Category 2" => ["Subcategory21", 'Subcategory22', 'Subcategory23'],
  "Category 3" => [],
}.each do |cat, subs|
  c = Category.create!(name: cat)
  subs.each { |s| Category.create!(name: s).move_to_child_of(c) }
end

count_posts = Category.all.size

tags = Array.new(10) { Faker::Lorem.word }

# create Posts
10.times do
  post = admin.posts.create(
    title: Faker::Lorem.sentence(rand(3..6)),
    content: Faker::Lorem.paragraph(rand(30..60)),
    tag_list: Array.new(rand(2..6)) { tags.sample }
  )
  post.category = Category.offset(rand(count_posts)).first
  rand(1..7).times do
    post.comments.create!(
      user: User.offset(rand(count_users)).first,
      text: Faker::Lorem.paragraph(rand(1..8)),
      status: rand(4)
    ) 
  end
  post.save!
end

Post.import
