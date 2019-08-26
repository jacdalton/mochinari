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
).tap do |cat|
  # if you want to add specific tags to a category, replace the word "tag" with the relevant word(s) you want to use as tags
  cat.tag_list.add "tag", "tag", "tag"
end

######################
#       Snacks       #
######################

# snack variable name will maybe need to be changed for each new snack created
snack = Snack.create!(
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
).tap do |s|
  # if you want to add specific tags to a snack, replace the word "tag" with the relevant word(s) you want to use as tags
  s.tag_list.add "tag", "tag", "tag"
end

######################
#    Snack Images    #
######################

# remember to update the snack variable name to match whatever you called your new snack
snack.snack_images << SnackImage.create!(
  # snack here also needs to be replaced with the variable name, i.e. snack: second_snack
  snack: snack,
  # same notes about image path as for category image path
  image_path: 'Image path goes here',
  # Comments have no requirements, and can be blank tbh
  comment: 'Leave a comment with the image',
  # User must exist
  user: User.all.sample
)



