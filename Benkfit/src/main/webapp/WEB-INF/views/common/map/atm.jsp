<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script>
	L_PREFER_CANVAS = false;
	L_NO_TOUCH = false;
	L_DISABLE_3D = false;
</script>
<script src="https://cdn.jsdelivr.net/npm/leaflet@1.4.0/dist/leaflet.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/leaflet@1.4.0/dist/leaflet.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css" />
<link rel="stylesheet"
	href="https://rawcdn.githack.com/python-visualization/folium/master/folium/templates/leaflet.awesome.rotate.css" />
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<style>
#map {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
}
</style>

<meta name="viewport"
	content="width=device-width,
        initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<style>
#map_240f69cca4564fd2aa5d192a423760e3 {
	position: relative;
	width: 620px;
	height: 600px;
	left: 0.0%;
	top: 0.0%;
	display: inline-block;
	margin-right: 100px;
	z-index: 1;
}
thead > tr > th{
	background: #2980B9;
	color: #ffffff;
	text-align: left;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin: 200px 0px; text-align: center;">
		<div class="folium-map" id="map_240f69cca4564fd2aa5d192a423760e3"></div>
		<div style="display: inline-block;">
			<table class="table eq-ui-data-table eq-ui-hoverable z-depth-1" style="height: 580px; width: 600px;">
				<thead>
					<tr>
						<th style="text-align: left; color: #ffffff">주소</th>
						<th style="text-align: left; color: #ffffff">은행</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${map}" var="map">
						<tr>
							<td style="text-align: left">${map.key}</td>
							<td style="text-align: left">${map.value}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
	<script>
		var bounds = null;

		var map_240f69cca4564fd2aa5d192a423760e3 = L.map(
				'map_240f69cca4564fd2aa5d192a423760e3', {
					center : [ 37.478714, 126.878651 ],
					zoom : 16,
					maxBounds : bounds,
					layers : [],
					worldCopyJump : false,
					crs : L.CRS.EPSG3857,
					zoomControl : true,
				});

		var tile_layer_6ecf0f99ec6c44d298c28ce064932a93 = L.tileLayer(
				'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
					"attribution" : null,
					"detectRetina" : false,
					"maxNativeZoom" : 18,
					"maxZoom" : 18,
					"minZoom" : 0,
					"noWrap" : false,
					"opacity" : 1,
					"subdomains" : "abc",
					"tms" : false
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var marker_a2c46fb21ec94310b53ef2e800ad548c = L.marker(
				[ 37.478745953, 126.87869343 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_c427a49903604af0af94a0ba2bf6dd8a = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_a2c46fb21ec94310b53ef2e800ad548c
				.setIcon(icon_c427a49903604af0af94a0ba2bf6dd8a);

		var popup_3b6ba709e0804ce0b7bf68c93508f6a6 = L.popup({
			maxWidth : '500'
		});

		var html_823dca19820541108efa8b4e48245e62 = $(`<div id="html_823dca19820541108efa8b4e48245e62" style="width: 100.0%; height: 100.0%;">서울 금천구 가산동426-5 월드메르디앙벤쳐센터2차</div>`)[0];
		popup_3b6ba709e0804ce0b7bf68c93508f6a6
				.setContent(html_823dca19820541108efa8b4e48245e62);

		marker_a2c46fb21ec94310b53ef2e800ad548c
				.bindPopup(popup_3b6ba709e0804ce0b7bf68c93508f6a6);

		var marker_75353612b1b34a0f9b4b08b276dc329f = L.marker(
				[ 37.479953206, 126.87700799 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_de277a23568f4da4b3f0c5514f8b97e3 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_75353612b1b34a0f9b4b08b276dc329f
				.setIcon(icon_de277a23568f4da4b3f0c5514f8b97e3);

		var popup_1f7ea48a7a424cf283ba9707e159321b = L.popup({
			maxWidth : '500'
		});

		var html_574863130b9c4529b4ee64bd6fb41687 = $(`<div id="html_574863130b9c4529b4ee64bd6fb41687" style="width: 100.0%; height: 100.0%;">서울특별시 금천구 서부샛길606</div>`)[0];
		popup_1f7ea48a7a424cf283ba9707e159321b
				.setContent(html_574863130b9c4529b4ee64bd6fb41687);

		marker_75353612b1b34a0f9b4b08b276dc329f
				.bindPopup(popup_1f7ea48a7a424cf283ba9707e159321b);

		var marker_6e35b37cab1543d0a46ef96e52b1e455 = L.marker(
				[ 37.477835211, 126.88052056 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_1a34578f041940aa99fe5772470184f5 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_6e35b37cab1543d0a46ef96e52b1e455
				.setIcon(icon_1a34578f041940aa99fe5772470184f5);

		var popup_176719299ca24947bf7b7ebc701ac651 = L.popup({
			maxWidth : '500'
		});

		var html_2ba2abc7dfff4c0781bc6ed169a33f8f = $(`<div id="html_2ba2abc7dfff4c0781bc6ed169a33f8f" style="width: 100.0%; height: 100.0%;">서울특별시 금천구 가산디지털2로 108(가산동429-1)</div>`)[0];
		popup_176719299ca24947bf7b7ebc701ac651
				.setContent(html_2ba2abc7dfff4c0781bc6ed169a33f8f);

		marker_6e35b37cab1543d0a46ef96e52b1e455
				.bindPopup(popup_176719299ca24947bf7b7ebc701ac651);

		var marker_2bb6f840bc3f41d4ae6593f5334e9c03 = L.marker(
				[ 37.477894802, 126.88066407 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_44b1a3e8e45a49cba75ab111bfa2d6a7 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_2bb6f840bc3f41d4ae6593f5334e9c03
				.setIcon(icon_44b1a3e8e45a49cba75ab111bfa2d6a7);

		var popup_323b9161ff1d4e6a8dcf4edbfe1b2287 = L.popup({
			maxWidth : '500'
		});

		var html_7bf42dcf90d74b4cbffdf91aa7277a1b = $(`<div id="html_7bf42dcf90d74b4cbffdf91aa7277a1b" style="width: 100.0%; height: 100.0%;">서울특별시 금천구 가산디지털2로 108</div>`)[0];
		popup_323b9161ff1d4e6a8dcf4edbfe1b2287
				.setContent(html_7bf42dcf90d74b4cbffdf91aa7277a1b);

		marker_2bb6f840bc3f41d4ae6593f5334e9c03
				.bindPopup(popup_323b9161ff1d4e6a8dcf4edbfe1b2287);

		var marker_3147d0a6d748459ab1130113d073a5af = L.marker(
				[ 37.479492312, 126.88149703 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_48b1208d7c5640c296ba2a69408252c3 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_3147d0a6d748459ab1130113d073a5af
				.setIcon(icon_48b1208d7c5640c296ba2a69408252c3);

		var popup_7bae717dd2f442a49e4734f248fa6dd8 = L.popup({
			maxWidth : '500'
		});

		var html_23e354a3e62341efbfec99ead5da9563 = $(`<div id="html_23e354a3e62341efbfec99ead5da9563" style="width: 100.0%; height: 100.0%;">서울 금천구 가산디지털1로 159 이랜드빌딩1층</div>`)[0];
		popup_7bae717dd2f442a49e4734f248fa6dd8
				.setContent(html_23e354a3e62341efbfec99ead5da9563);

		marker_3147d0a6d748459ab1130113d073a5af
				.bindPopup(popup_7bae717dd2f442a49e4734f248fa6dd8);

		var marker_255688cbc95e4a0cb1b88e56bc7db7ee = L.marker(
				[ 37.478169025, 126.88159911 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_d2b754c2ecbb4d0eb86d60d9cb360a53 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_255688cbc95e4a0cb1b88e56bc7db7ee
				.setIcon(icon_d2b754c2ecbb4d0eb86d60d9cb360a53);

		var popup_7be2ec71624448f09341331aba02ecd9 = L.popup({
			maxWidth : '500'
		});

		var html_db01e48057674633a4c16653e4b0d162 = $(`<div id="html_db01e48057674633a4c16653e4b0d162" style="width: 100.0%; height: 100.0%;">서울특별시 금천구 가산디지털1로 145</div>`)[0];
		popup_7be2ec71624448f09341331aba02ecd9
				.setContent(html_db01e48057674633a4c16653e4b0d162);

		marker_255688cbc95e4a0cb1b88e56bc7db7ee
				.bindPopup(popup_7be2ec71624448f09341331aba02ecd9);

		var marker_27c7518b595447e5b76cb206557649df = L.marker(
				[ 37.476530711, 126.88137371 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_eb3017b5ab544eeab44243bb3a8a4109 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_27c7518b595447e5b76cb206557649df
				.setIcon(icon_eb3017b5ab544eeab44243bb3a8a4109);

		var popup_90cef1c1641c4e82807cde6531f98d1e = L.popup({
			maxWidth : '500'
		});

		var html_8edfff455b1e4a1fa47687a8f5363cba = $(`<div id="html_8edfff455b1e4a1fa47687a8f5363cba" style="width: 100.0%; height: 100.0%;">서울특별시 금천구 가산디지털2로 98</div>`)[0];
		popup_90cef1c1641c4e82807cde6531f98d1e
				.setContent(html_8edfff455b1e4a1fa47687a8f5363cba);

		marker_27c7518b595447e5b76cb206557649df
				.bindPopup(popup_90cef1c1641c4e82807cde6531f98d1e);

		var marker_9ff7f29a3510453b8f49edc46634d4ab = L.marker(
				[ 37.476530711, 126.88137371 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_f648a9647a8b4d96b2144814d444dfb6 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_9ff7f29a3510453b8f49edc46634d4ab
				.setIcon(icon_f648a9647a8b4d96b2144814d444dfb6);

		var popup_bd1d4a361ef842faaa665d210742b46e = L.popup({
			maxWidth : '500'
		});

		var html_f1bb51de55be467885bcb7c4d54177f4 = $(`<div id="html_f1bb51de55be467885bcb7c4d54177f4" style="width: 100.0%; height: 100.0%;">서울 금천구 가산디지털2로 98</div>`)[0];
		popup_bd1d4a361ef842faaa665d210742b46e
				.setContent(html_f1bb51de55be467885bcb7c4d54177f4);

		marker_9ff7f29a3510453b8f49edc46634d4ab
				.bindPopup(popup_bd1d4a361ef842faaa665d210742b46e);

		var marker_459bbc1611454bef932ed2d757f9114a = L.marker(
				[ 37.477047717, 126.88221556 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_5004d117fe054c39a492f0909d599ec7 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_459bbc1611454bef932ed2d757f9114a
				.setIcon(icon_5004d117fe054c39a492f0909d599ec7);

		var popup_6651e276c5dd4ba5a89c4cfbb84a5eac = L.popup({
			maxWidth : '500'
		});

		var html_f688abcca2db4a4e9e6d360be2dc2a05 = $(`<div id="html_f688abcca2db4a4e9e6d360be2dc2a05" style="width: 100.0%; height: 100.0%;">서울특별시 금천구 가산디지털1로 131</div>`)[0];
		popup_6651e276c5dd4ba5a89c4cfbb84a5eac
				.setContent(html_f688abcca2db4a4e9e6d360be2dc2a05);

		marker_459bbc1611454bef932ed2d757f9114a
				.bindPopup(popup_6651e276c5dd4ba5a89c4cfbb84a5eac);

		var marker_cf400a3d3b1d4d3fb80ac4b844a596ef = L.marker(
				[ 37.479965803, 126.88263616 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_4daf3c9b092d462c80ec3ead97a15828 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_cf400a3d3b1d4d3fb80ac4b844a596ef
				.setIcon(icon_4daf3c9b092d462c80ec3ead97a15828);

		var popup_8a03fdfdfcec40f7929b23aa7847327f = L.popup({
			maxWidth : '500'
		});

		var html_91c739a369a5450bba8e69c2b8b9cf97 = $(`<div id="html_91c739a369a5450bba8e69c2b8b9cf97" style="width: 100.0%; height: 100.0%;">서울특별시 금천구 가산디지털1로 168</div>`)[0];
		popup_8a03fdfdfcec40f7929b23aa7847327f
				.setContent(html_91c739a369a5450bba8e69c2b8b9cf97);

		marker_cf400a3d3b1d4d3fb80ac4b844a596ef
				.bindPopup(popup_8a03fdfdfcec40f7929b23aa7847327f);

		var marker_3d4419fc4e1e40fa9ee731260a494cdd = L.marker(
				[ 37.479965803, 126.88263616 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_c536d598a216416aafa4c4cc0562d622 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_3d4419fc4e1e40fa9ee731260a494cdd
				.setIcon(icon_c536d598a216416aafa4c4cc0562d622);

		var popup_1eefb77cac3f4171ac231c8af44ce3cf = L.popup({
			maxWidth : '500'
		});

		var html_dda2e2a798274d5ea5392991c6db9f5f = $(`<div id="html_dda2e2a798274d5ea5392991c6db9f5f" style="width: 100.0%; height: 100.0%;">서울 금천구 가산디지털1로 168</div>`)[0];
		popup_1eefb77cac3f4171ac231c8af44ce3cf
				.setContent(html_dda2e2a798274d5ea5392991c6db9f5f);

		marker_3d4419fc4e1e40fa9ee731260a494cdd
				.bindPopup(popup_1eefb77cac3f4171ac231c8af44ce3cf);

		var marker_2063bd29c45b4d47991cdf0ddc9b1b41 = L.marker(
				[ 37.481970706999995, 126.88151194 ], {
					icon : new L.Icon.Default(),
				}).addTo(map_240f69cca4564fd2aa5d192a423760e3);

		var icon_4d11547399f94857b8622c45f3cf0336 = L.AwesomeMarkers.icon({
			icon : 'info-sign',
			iconColor : 'white',
			markerColor : 'red',
			prefix : 'glyphicon',
			extraClasses : 'fa-rotate-0'
		});
		marker_2063bd29c45b4d47991cdf0ddc9b1b41
				.setIcon(icon_4d11547399f94857b8622c45f3cf0336);
	</script>
</body>
</html>