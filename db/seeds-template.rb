######################
#      Category      #
######################

Category.create!(
  # name must be present, unique, and under 20 characters long
  name: 'Snack name goes here',
  # description must be present (no other restrictions)
  description: 'Snack desc goes here',
  # image_path should be 'image.png' if in base assets/images folder
  # should include folder structure if nested, i.e. 'snackoverflow/taiyaki/taiyaki-choco1.jpeg'
  image_path: 'Image path goes here'
)

######################
#       Snacks       #
######################

Snack.create!(
  # User must be present (Can be randomly sampled, try not to set to specific id though because ids will change everytime seed is run)
  # Must be instance of User
  user: User.all.sample,
  # Category must be present, please select from list provided in Category.all
  # To see list of categories available, go into rails console and use the following:
  # Category.all.map { |c| c.name }
  # Category must be an instance
  category: Category.find_by_name("Category name goes here"),
  # Snack name must be present & unique to the shop_location
  name: 'Snack name goes here',
  # Snack description must be present & a minimum of 20 characters
  description: 'Description goes here',
  # Shop_location must be present
  # Please check that the location can be geocoded before adding - this is a bit tricky to check - the best way would be to go to Google Maps and search for the location by name (if it can autocomplete most likely it can be geocoded)
  shop_location: 'Location goes here'
)

######################
#    Snack Images    #
######################

SnackImage.create!(
  # Snack must be an instance of a snack
  snack: Snack.find_by_name("Snack name goes here"),
  image_path: sample_snack_images.sample,
  comment: 'Tasty treat, looking forward to enjoying again!',
  user: User.all.sample
)