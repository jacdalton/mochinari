function autocompleteTrail() {
  document.addEventListener("DOMContentLoaded", function() {
    var trail_loc = document.getElementById('trail_location');

    if (trail_loc) {
      var autocomplete = new google.maps.places.Autocomplete(trail_loc, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(trail_loc, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocompleteTrail };