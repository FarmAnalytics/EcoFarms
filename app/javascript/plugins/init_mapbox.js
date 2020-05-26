import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      center: [2.3522219, 48.856614],
      zoom: 10,
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  }
};

export { initMapbox };
