require 'faker'
# require 'csv'

#   Destroy all existing seeds
puts 'Destroying all favorites...'
Favorite.destroy_all

puts 'Destoying all snack images...'
SnackImage.destroy_all

puts 'Destoying all snack ratings...'
SnackRating.destroy_all

puts 'Destoying all snacks...'
Snack.destroy_all

puts 'Destoying all trails...'
Trail.destroy_all

puts 'Destoying all users...'
User.destroy_all

puts 'Destoying all categories...'
Category.destroy_all

puts 'Destoying all tags...'
ActsAsTaggableOn::Tag.destroy_all


# User - Generate 5 + test account
# ----------------
# - email
# - password
# - username
# - location ( will need to update seeds for this, once map is implemented )

puts 'Generating Katy and Bobby...'

User.create!(
  email: 'bobby@gmail.com',
  password: '123123',
  username: 'bobby3ats'
)

puts 'Creating test users...'

usernames = [
  "mitch-sensei",
  "tanaka-san",
  "brykka",
  "jacque.desu",
  "doug-sempai",
]

usernames.each do |un|
  User.create!(
    email: Faker::Internet.email,
    password: "123123",
    username: un
  )
end


csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'snackseeds.csv'

shop_location_array = ['Ramen Jiro Meguro', 'Mos Burger Meguro', 'OGGI Meguro', 'Jojoen Meguro', 'Burari Meguro', 'Otori Park', 'Tonkatsu Tonki', 'Peanuts Cafe Meguro', 'Shibuya 109', 'Shibuya Tsutaya', 'Shibuya Loft', 'Tower Records Shibuya', 'Shibuya Loft', 'Whoopi Goldburger', 'Uobei Shibuya', 'Onigily Cafe Meguro', "Moke's Bread & Breakfast Nakameguro", 'Hacienda Del Cielo Shibuya', 'The Works Meguro']

CSV.foreach(filepath, csv_options) do |row|
  # p " category: #{row["Snack Category"]}, snack:  #{row['Snack "name"']} photos:  #{row["# of Photos"]} description: #{row["Description"]}"
  cat =  Category.find_or_create_by(name: row["Snack Category"])
  if cat.new_record?
    cat = Category.create(
      name: row["Snack Category"],
      description: row["Description"],
      image_path: "#{row["Snack Category"]}/#{row["Snack Category"]}1.jpeg"
    )

  end


  snack = Snack.create(
    name: row["Snack Name"],
    description: row["Description"],
    shop_location: shop_location_array.sample,
    category: cat,
    user: User.all.sample
  )

  Pathname.new(Rails.root.join("app/assets/images/#{snack.category.name}/#{row["Snack Slug"]}#{1}.jpeg")).open

  row["# of Photos"].to_i.times do |i|
    image = SnackImage.create!(
      user: User.all.sample,
      snack: snack,
      image_path: Pathname.new(Rails.root.join("app/assets/images/#{snack.category.name}/#{row["Snack Slug"]}#{i + 1}.jpeg")).open
    )
    p image
  end

  # p snack.errors.messages
  # p dir =  Rails.root.join('app', 'assets', 'images', row["Snack Category"]).glob("*").first.open
end

#   Create new

# Category - Generate 2 (manual)
# ----------------
# - name
# - description
# - image

# puts 'Creating test categories...'

# Category.create!(
# name: 'Taiyaki',
# description: 'Taiyaki (鯛焼き, lit. ‘baked sea bream’) is a Japanese fish-shaped cake. It imitates the shape of the tai (Japanese red seabream), which it is named after. The most common filling is red bean paste that is made from sweetened azuki beans. Other common fillings may be custard, chocolate, cheese, or sweet potato. Some shops even sell taiyaki with okonomiyaki, gyoza filling, or a sausage inside.',
# image_path: 'taiyaki.jpg'
# )

# Category.create!(
#   name: 'Mochi',
#   description: 'Mochi (Japanese: 餠, もち) is Japanese rice cake made of mochigome, a short-grain japonica glutinous rice, and sometimes other ingredients such as water, sugar, and cornstarch. The rice is pounded into paste and molded into the desired shape. In Japan it is traditionally made in a ceremony called mochitsuki.[1] While also eaten year-round, mochi is a traditional food for the Japanese New Year and is commonly sold and eaten during that time.',
#   image_path: 'mochi.jpg'
# )

# puts 'Creating test snacks...'

# snacks = ['pink plum daifuku', 'shouyu butter senbei', 'pink salt rice crackers', 'Custard azuki taiyaki', 'melon syrup kakigori', 'butter frosted castella', 'apricot youkan', 'koshian manju', 'sakura mochi', 'maccha dorayaki']

# snacks.map! { |snack| snack.titleize }

# shop_locations = ['Tokyo Skytree', 'DisneySea', 'Shake Shack Ebisu', 'Laxmi Meguro']

# snacks.each do |snack|
#   Snack.create!(
#     user: User.all.sample,
#     category: Category.all.sample,
#     name: snack,
#     description: "This is a test description for #{snack}",
#     shop_location: shop_locations.sample
#   )
# end

# # Favorites - Generate 5 per user

# puts 'Creating favorites for each user...'

# User.all.each do |user|
#   6.times do
#     user.favorite(Snack.all.sample)
#   end
# end

# Snack Images - Generate rand (3..5) times per Snack
# ----------------
# - snack: snack
# - image_path: (array of asset image paths).sample
# - comment: 'Tasty treat, looking forward to enjoying again!'
# - user: User.all.sample

# sample_snack_images = ['castella.jpg', 'cheesecake.jpg', 'momiji.jpg', 'sakuramochi.jpg',
#                        'strawmilk.jpg', 'yokan.jpg', 'j-apricot-thing.jpg', 'j-cafechan.jpg', 'j-cookie-sando.jpg', 'j-crepe.jpg', 'j-ichigo-kakigoori.jpg', 'j-kurozatou-dorayaki.jpg', 'j-pichan.jpg', 'j-taiyaki.jpg', 'j-takoyaki.jpg', 'j-waffle.jpg']

# puts 'Creating test snack images...'

# Snack.all.each do |snack|
#   6.times do
#     SnackImage.create!(
#       snack: snack,
#       image_path: sample_snack_images.sample,
#       comment: 'Tasty treat, looking forward to enjoying again!',
#       user: User.all.sample
#     )
#   end
# end

# Trails - Generate rand(1..3) times per User
# ----------------
# - name
# - trails.snacks_trails.snack = Snack.all.sample
# - location

# trail_names = ['Hungry Hungover Trail', 'Mochi Mochi Hungry Desu', 'Taiyaki Day']

# puts 'Creating test trails...'

# User.all.each do |user|
#   rand(1..3).times do
#     Trail.create!(
#       user: user,
#       name: trail_names.sample,
#       location: Faker::Address.city
#     ).tap do |trail|
#       trail.snacks = Snack.all.sample(3)
#     end
#   end
# end

# Snack Ratings - Generate rand(1..5) times per User
# ----------------
# - sample Snack.all
# - stars: rand(1..5)

puts 'Creating test snack ratings...'

User.all.each do |user|
  10.times do
    SnackRating.create!(
      user: user,
      snack: Snack.all.sample,
      stars: rand(1..5)
    )
  end
end

# Tags - maximum 6 each for snacks, max 3 each for categories

tags_array = ['chewy', 'crunchy', 'creamy', 'sweet beans', 'green tea', 'frosted', 'hot', 'ice cream']

puts 'Creating tags for snacks and categories...'

Snack.all.each do |snack|
  6.times do
    snack.tag_list.add(tags_array.sample)
    snack.save
  end
end

Category.all.each do |category|
  3.times do
    category.tag_list.add(tags_array.sample)
    category.save
  end
end

User.create!(
  email: 'katy@gmail.com',
  password: '123123',
  username: 'katy.smith711'
)

puts 'Seeds created!'
