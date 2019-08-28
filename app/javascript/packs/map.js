import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
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
  console.log(markers)
  // map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
