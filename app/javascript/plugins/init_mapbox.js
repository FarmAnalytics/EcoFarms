import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
  });
 return map
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';
    const mark = new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    const el = mark._element
    el.addEventListener('click', (event) => { 
      mapElement.insertAdjacentHTML('beforeend', marker.infoWindow)
    });
  }); 
};

const fitMapToMarkers = (map, markers) => {
  if (mapElement.dataset.longitude === "") {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  
   } else {
    const coordinates = []
    coordinates.push(parseFloat(mapElement.dataset.longitude));
    coordinates.push(parseFloat(mapElement.dataset.latitude));
  }
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    // fitMapToMarkers(map, markers);
    if (mapElement.dataset.longitude === "") {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
    
     } else {
      const coordinates = []
      coordinates.push(parseFloat(mapElement.dataset.latitude));
      coordinates.push(parseFloat(mapElement.dataset.longitude));
      console.log(coordinates)
      map.setCenter(coordinates);
      console.log(map.getCenter());

      map.setZoom(10);
    }
  }
};

export { initMapbox };
