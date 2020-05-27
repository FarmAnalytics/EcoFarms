import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const mark = new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    const el = mark._element
    el.addEventListener('click', (event) => { 
      mapElement.insertAdjacentHTML('beforeend', marker.infoWindow)
    });
  }); 
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    const popups = document.querySelector('.mapboxgl-marker');
      // popups.forEach((popup) => {
      //   console.log(popup);
      //   popup.addEventListener('click', (event) => 
      //     mapElement.insertAdjacentHTML('beforeend', marker.infoWindow)
      //   );
    //   }
    // })
  }
};

export { initMapbox };
