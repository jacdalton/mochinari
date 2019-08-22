function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var snack_loc = document.getElementById('snack_shop_location');

    if (snack_loc) {
      var autocomplete = new google.maps.places.Autocomplete(snack_loc, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(snack_loc, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };