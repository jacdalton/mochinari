var map;

function initMap() {
  const mapElement = document.getElementById('user-map');
  const infoWindow = new google.maps.InfoWindow;

  if (mapElement) { // don't try to build a map if there's no div#map to inject in
     map = new google.maps.Map(
      mapElement,
      {
        zoom: 16,
        center: {lat: 0, lng: 0}
      }
    );

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach(marker => {
      new google.maps.Marker(
        {
          position: marker,
          map: map,
          icon: "https://res.cloudinary.com/dh9izywry/image/upload/v1566961193/map_marker_vkn0cj.png"
        }
      )
    });
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        infoWindow.setPosition(pos);
        infoWindow.setContent('You are here');
        infoWindow.open(map);
        map.setCenter(pos);
      }, function() {
        console.log(map)
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  }
}

initMap();

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  infoWindow.open(map);
}


