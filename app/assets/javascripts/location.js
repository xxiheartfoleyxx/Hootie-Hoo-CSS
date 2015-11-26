var map;
var infowindow;


function initMap() {

  if(navigator.geolocation) {
   navigator.geolocation.getCurrentPosition(function(position){
     var lat = position.coords.latitude;
     var lon = position.coords.longitude;
     console.log(lat);
     console.log(lon);

  console.log(lat);
  var pyrmont = {lat: lat, lng: lon};

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 19
  });

  infowindow = new google.maps.InfoWindow();

  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: pyrmont,
    radius: 100,
    types: ['restaurants']
  }, callback);
});
};
};

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}
