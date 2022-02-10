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
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">Fishing</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<%
					if (userID == null) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">로그인</a>
						<ul class="dropdown-menu dropdown-menu-dark"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
						</ul></li>
					<%
					} else {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
						<ul class="dropdown-menu dropdown-menu-dark"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
						</ul></li>
					<%
					}
					%>
					<li class="nav-item"><a class="nav-link" href="point.jsp">낚시 포인트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">낚시 용품</a></li>
					<li class="nav-item"><a class="nav-link" href="board.jsp">자유 게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>

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