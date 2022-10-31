<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <body>
      <script src="https://accounts.google.com/gsi/client" async defer></script>
      <script src="https://apis.google.com/js/platform.js" async defer></script>
      <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script>
        function handleCredentialResponse(response) {
        	const responsePayload = parseJwt(response.credential);
        	console.log("ID: " + responsePayload.sub);
            console.log('Full Name: ' + responsePayload.name);
            console.log('Given Name: ' + responsePayload.given_name);
            console.log('Family Name: ' + responsePayload.family_name);
            console.log("Image URL: " + responsePayload.picture);
            console.log("Email: " + responsePayload.email);
        }
        function parseJwt (token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));

            return JSON.parse(jsonPayload);
        };
        window.onload = function () {
          google.accounts.id.initialize({
            client_id: "609009193609-b797q62q035jhkamfo8ebei82sr5612j.apps.googleusercontent.com",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large", width: 368}  // customization attributes
          );
          google.accounts.id.prompt(); // also display the One Tap dialog
        }
    </script>
    <div id="buttonDiv"></div> 
    <div id="map" style="width:500px;height:500px;"></div>
  </body>
  
<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1QwIN3hpH6XpwIx-Yg0F5u-JnvMX_GZw&callback=initMap"></script>
<script>
/*==============================내 위치 지도 띄우기================================  */
let map, infoWindow;
function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: -34.397, lng: 150.644 },
    zoom: 17,
  });
  infoWindow = new google.maps.InfoWindow();

  const locationButton = document.createElement("button");

  locationButton.textContent = "내 위치 찾기";
  locationButton.classList.add("custom-map-control-button");
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
  locationButton.addEventListener("click", () => {
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };

          infoWindow.setPosition(pos);
          infoWindow.setContent("난 여깄어!!");
          infoWindow.open(map);
          map.setCenter(pos);
        },
        () => {
          handleLocationError(true, infoWindow, map.getCenter());
        }
      );
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}

window.initMap = initMap;
</script>
</html>