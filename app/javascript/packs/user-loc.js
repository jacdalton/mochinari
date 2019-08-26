import GMaps from 'gmaps/gmaps.js';

function initMap() {
  const mapElement = document.getElementById('user-map');
  const infoWindow = new google.maps.InfoWindow;

  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new google.maps.Map(
      mapElement, 
      {
        zoom: 4, 
        center: {lat: 0, lng: 0}
      }
    );
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    markers.forEach(marker => {
      new google.maps.Marker(
        {
          position: marker,
          map: map
        }
      )
    });
    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
    }
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