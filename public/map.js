/*global google*/
/*global gon*/
/*global geocoder*/
/*global marker*/
let map
function initMap(){
  const geocoder = new google.maps.Geocoder()

  const map = new google.maps.Map(document.getElementById('map'), {
    //latが緯度、lngが経度を示します
    center: {
      lat: gon.user.latitude,
      lng: gon.user.longitude
    },
    //数値は0〜21まで指定できます。数値が大きいほど拡大されます
    zoom: 12,
  });
  //positionに指定した座標にピンを表示させます
  const marker = new google.maps.Marker({
    position:  {
      lat: gon.user.latitude,
      lng: gon.user.longitude
    },
    map: map
  });
}