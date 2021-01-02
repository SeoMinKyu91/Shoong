<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<!-- mapbox core-->
<script src="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.js"></script>
<link href="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.css" rel="stylesheet" />
<!-- mapbox geocoder -->
<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.min.js"></script>
<link
	rel="stylesheet"
	href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.css"
	type="text/css" />
<!-- mabox directions -->
<script
	src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.js"></script>
<link rel="stylesheet"
	href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.css"
	type="text/css" />
	
<style>
	body {
		margin: 0;
		padding: 0;
	}
	
	#map {
		position: absolute;
		top: 0;
		bottom: 0;
		width: 100%;
		height: 100%
	}
	.marker {
	  background-image: url('http://localhost:8080/springapp/images/mapbox-icon.png');
	  background-size: cover;
	  width: 50px;
	  height: 50px;
	  border-radius: 50%;
	  cursor: pointer;
	}
		
	.mapboxgl-popup {
	  max-width: 200px;
	}
	
	.mapboxgl-popup-content {
	  text-align: center;
	  font-family: 'Open Sans', sans-serif;
	}
	
	.mapboxgl-ctrl-geocoder {
		width: 260px;
		padding-left: 19px;
	}
</style>
<div id="colorlib-main" style="padding-top: 100px">
	<div id="map"></div>
</div>

<script>
	//맵박스 토큰
	mapboxgl.accessToken = 'pk.eyJ1Ijoid2t1bmdoOTMiLCJhIjoiY2tpd2hpNnZ0MHF3YzMwcnd5ZG1obzh2biJ9.EW26scaL6pDX7yQhFNnwMw';
	/*
	//맵박스 객체
	var map = new mapboxgl.Map({
		container : 'map',
		style : 'mapbox://styles/mapbox/streets-v11',
		center : [ 126.87870025634767, 37.478732138068445 ],
		zoom : 16
	});
	*/
	
	var monument = [126.87870025634767, 37.478732138068445];
	var map = new mapboxgl.Map({
	container: 'map',
	style: 'mapbox://styles/mapbox/streets-v11',
	center: monument,
	zoom: 16
	});
	 
	// create the popup
	var popup = new mapboxgl.Popup({ offset: 25 }).setText(
	'Construction on the Washington Monument began in 1848.'
	);
	 
	// 마커용 돔트리 생성
	var el = document.createElement('div');
  	el.className = 'marker';
	// create the marker
	/*
	var marker = new mapboxgl.Marker(el)
					.setLngLat(monument)
					.setPopup(popup) // sets a popup on this marker
					.setHTML('<h3>real</h3>')
					.addTo(map);
	*/
	/*
	//행정구역 별 구분선 추가
	map.on('load',function() {
		map.addSource('states',{
					'type' : 'geojson',
					'data' : 'https://raw.githubusercontent.com/vuski/admdongkor/master/ver20201001/HangJeongDong_ver20201001.geojson'
					});
		}
	);
	*/
	/**/
	//맵박스 다이렉션 컨트롤러 추가
	map.addControl(new MapboxDirections({
		accessToken : mapboxgl.accessToken
	}), 'bottom-left');
	
	/**/
	//맵박스 지오코더 컨트롤러 추가
	map.addControl(
			new MapboxGeocoder({
			accessToken: mapboxgl.accessToken,
			mapboxgl: mapboxgl
			}), 'top-left');
	//맵박스 현재위치 추적 https 필요
	map.addControl(new mapboxgl.GeolocateControl({
		positionOptions : {
			enableHighAccuracy : true
		},
		trackUserLocation : true
	}));
	
	//디폴트 마커 추가
	map.on('load', function () {
		//맵 클릭하면 해당위치 마커 생성
		map.on('click', function(e) {
			if(marker!=null){
				marker.remove();
			}
			// The event object (e) contains information like the
			// coordinates of the point on the map that was clicked.
			console.log('lngLat:%o',e.lngLat);
			//팝업생성
			var popup = new mapboxgl.Popup({ offset: 25 }).setText(
					'Construction on the Washington Monument began in 1848.');
			// 마커 생성
			marker = new mapboxgl.Marker(el).setLngLat(e.lngLat).setPopup(popup).addTo(map);
		});
	});
	
</script>