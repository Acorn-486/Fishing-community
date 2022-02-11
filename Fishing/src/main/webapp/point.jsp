<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="resource/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Fishing</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="map" style="width: 100%; height: 650px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b729c72d0c369967c28ea19598cd8bd&libraries=clusterer"></script>
	<script>
		var map = new kakao.maps.Map(document.getElementById('map'), {
			center: new kakao.maps.LatLng(36.15810735339455, 127.79537338994754),
        	level: 13
		});
		
		var clusterer = new kakao.maps.MarkerClusterer({
            map: map,
            averageCenter: true,
            minLevel: 2,
            disableClickZoom: true
        });
		
		$.get("resource/data/point.json", function (data) {
            var markers = $(data.positions).map(function (i, position) {
                var maks = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(position.x, position.y)
                });

                var infowindow = new kakao.maps.InfoWindow({
                    content: position.title,
                    removable: true
                });


                kakao.maps.event.addListener(maks, 'click', makeOverListener(map, maks, infowindow));

                return maks;

            });

            clusterer.addMarkers(markers);

        });

        function makeOverListener(map, marker, infowindow) {
            infowindow.close();
            return function () {
                infowindow.open(map, marker);
            };
        }

        function makeOutListener(infowindow) {
            return function () {
                infowindow.close();
            };
        }
        
        kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

            var level = map.getLevel()-1;

            map.setLevel(level, {anchor: cluster.getCenter()});
        });

	</script>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>