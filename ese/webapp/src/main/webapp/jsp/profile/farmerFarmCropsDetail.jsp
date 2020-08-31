<%@ include file="/jsp/common/detail-assets.jsp"%>
<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<!-- add this meta information to select layout  -->
<meta name="decorator" content="swithlayout">
<link rel="stylesheet" href="plugins/openlayers/theme/default/style.css"
	type="text/css">
<script src="plugins/openlayers/OpenLayers.js"></script>
<link href="plugins/jplayer/jplayer.blue.monday.min.css"
	rel="stylesheet" type="text/css" />

</head>

<script src="js/dynamicComponents.js?v=19.14"></script>

<div style="float: right; margin-right: 1.5%" class="hide">
	<table>
		<tr>
			<td style="font-weight: bold;"><i class="fa fa-user"
				aria-hidden="true" style="color: blue"></i>&nbsp;&nbsp;&nbsp;<s:text
					name="Farmer Name : " /></td>
			<td><s:property value="farmCrops.farm.farmer.name" /></td>
		</tr>
		<tr>
			<td style="font-weight: bold;"><i class="fa fa-pagelines"
				aria-hidden="true" style="color: green"></i>&nbsp;&nbsp;&nbsp;<s:text
					name="Farm Name: " /></td>
			<td><s:property value="farmCrops.farm.farmName" /></td>
		</tr>
	</table>
</div>


<div class="flexbox-container">

	<s:form name="form" cssClass="fillform">
		<s:hidden key="currentPage" />
		<s:hidden key="id" />
		<s:hidden key="command" />
		<s:hidden key="farmCrops.id" class='uId' />
		<s:hidden name="farmId" value="%{farmId}" />
		<s:hidden id="estimatedYieldMetricTonnes"
			name="estimatedYieldMetricTonnes" value="%{farmCrops.estimatedYield}" />

		<!-- farm crop start  -->

		<div id="accordion" class="custom-accordion farmerCrop_Info">
			<div class="card-header card mb-1 shadow-none">
				<a href="#farmerCrop_Info" class="text-dark" data-toggle="collapse"
					aria-expanded="true" aria-controls="collapseOne">
					<div class="card-header" id="headingOne">
						<h6 class="m-0">
							<div class="wizard-wrapper">
								<div class="wizard-icon">
									<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path
												d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path
												d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
												fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
									</span>

								</div>
								<div class="wizard-label">

									<h3 class="wizard-title">
										<s:property value="%{getLocaleProperty('info.farmCrops')}" />
									</h3>
									<div class="wizard-desc">Setup Farmer Crop Information
										Details</div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>

			<div id="farmerCrop_Info" class="collapse show"
				aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">

					<div class="row">

						<div class="col-md-4">
							<div class="form-group farmName">
								<label for="txt"> <s:property
										value="%{getLocaleProperty('farm.name')}" /> <sup
									style="color: red;">*</sup>
								</label>

								<div class="">
									<p class="form-control">
										<s:property value="farmCrops.farm.farmName" />
									</p>
								</div>



							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group cropCategory">
								<label for="txt"> <s:text
										name="farmcrops.cropCategory.prop" />
								</label>
								<div class="">
									<s:radio name="farmCrops.cropCategory"
										onchange="cropDiv(this,'onchange');"
										value="defaultCropCategoryValue" list="cropCategories"
										id="cropCat" />
								</div>
							</div>
						</div>


						<div class="col-md-4">
							<div class="form-group cropSeason">
								<label for="txt"> <s:property
										value="%{getLocaleProperty('farmcrops.cropSeason')}" /> <sup
									style="color: red;">*</sup>
								</label>
								<div class="">
									<p class="form-control">
										<s:property value="farmCrops.cropSeason.name" />
									</p>

								</div>
							</div>
						</div>


					</div>

					<div class="row">
						<div class="col-md-4">
							<div class="form-group cultivationType">
								<label for="txt"> <s:property
										value="%{getLocaleProperty('farmCrops.CultivationType')}" /><sup
									style="color: red;"></sup>
								</label>
								<div class="">

									<p class="form-control">
										<s:property value="farmCrops.cropCategoryList" />
									</p>

								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group farmcropName">
								<label for="txt"> <s:property
										value="%{getLocaleProperty('farmcropName')}" /> <sup
									style="color: red;">*</sup>
								</label>
								<div class="">
									<p class="form-control">
										<s:property
											value="farmCrops.procurementVariety.procurementProduct.name" />
									</p>

								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group variety">
								<label for="txt"> <s:property
										value="%{getLocaleProperty('variety')}" /> <sup
									style="color: red;">*</sup>
								</label>
								<div class="">
									<p class="form-control">
										<s:property value="farmCrops.procurementVariety.name" />
									</p>
								</div>
							</div>
						</div>
					</div>
					<s:if test="cropInfoEnabled==1">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group cultiArea">
									<label for="txt"> <s:property
											value="%{getLocaleProperty('cultiArea')}" /> (<s:property
											value="%{getAreaType()}" />) <sup style="color: red;">*</sup>
									</label>
									<div class="">
										<p class="form-control">
											<s:property value="farmCrops.cultiArea" />
										</p>

									</div>
								</div>
							</div>
							<div class="col-md-4" id="sowingDate">
								<div class="form-group sowingDate">
									<label for="txt"> <s:property
											value="%{getLocaleProperty('farmcrops.sowingDate')}" />
										(MM/DD/YYYY) <sup style="color: red;">*</sup>
									</label>
									<div class="">
										<p class="form-control">
											<s:property value="sowingDate" />
										</p>

									</div>
								</div>
							</div>
							<div class="col-md-4" id="typetr">
								<div class="form-group type">
									<label for="txt"> <s:property
											value="%{getLocaleProperty('type')}" />
									</label>
									<div class="">
										<div class="form-element">
											<p class="form-control">
												<s:property value="farmCrops.type" />
											</p>

										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4">
								<div class="form-group estimatedYeild">
									<label for="txt"><s:property
											value="%{getLocaleProperty('farmfarmcrops.estimatedYeild')}" />
									</label>
									<div class="">

										<p class="form-control">
											<s:property value="farmCrops.estimatedYield" />
										</p>


									</div>
								</div>
							</div>
							<div class="col-md-4" id="sowingDate">
								<div class="form-group sowingDate">
									<label for="txt"><s:property
											value="%{getLocaleProperty('farmfarmcrops.estimatedYeild.tonnes')}" />
									</label>
									<div class="">
										<p class="form-control" id="estimatedYieldMetTon"></p>

									</div>
								</div>
							</div>

						</div>


					</s:if>
				</div>
			</div>
		</div>

		<!-- farm crop end  -->

		<!-- btn start  -->
		<div class="flexItem flex-layout flexItemStyle  float-right">


			<span id="button" class="yui-button"><span class="first-child">
					<button type="button" id="update"
						class="btn btn-success waves-effect waves-light">
						<i class="ri-check-line align-middle mr-2"></i>Edit
					</button>

			</span></span> <span id="cancel" class="yui-button"><span
				class="first-child">
					<button type="button" id="cancel" onclick="onCancel()"
						class="btn btn-warning waves-effect waves-light">
						<i class="ri-error-warning-line align-middle mr-2"></i>
						<s:text name="back.button" />
					</button>

			</span></span>
		</div>
		<!-- btn end -->


	</s:form>
</div>
<s:form name="updateform" action="farmCrops_update.action">
	<s:hidden name="farmId" value="%{farmId}" />
	<s:hidden name="farmerId" value="%{farmCrops.farm.farmer.id}" />
	<s:hidden name="farmerUniqueId" value="%{farmCrops.farm.farmer.id}" />
	<s:hidden name="tabIndexz" value="%{tabIndexz}" />
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="deleteform" action="farmCrops_delete.action">
	<s:hidden name="farmId" value="%{farmId}" />
	<s:hidden name="farmerId" value="%{farmerId}" />
	<s:hidden name="tabIndexFarm" value="%{tabIndexz}" />
	<s:hidden name="tabIndexz" value="%{tabIndexz}" />
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="cancelform" action="farmer_detail.action%{tabIndexz}">
	<s:hidden name="farmId" value="%{farmId}" />
	<s:hidden name="farmerId" value="%{farmerId}" />
	<s:hidden name="sangham" value="%{farmCrops.farm.farmer.sangham}" />
	<s:hidden name="tabIndex" value="#tabs-3" />
	<s:hidden key="id" value="%{farmCrops.farm.farmer.id}" />
	<s:hidden key="currentPage" />
</s:form>

<s:form name="listForm" id="listForm" action="farmer_detail.action">
	<s:hidden name="farmerId" value="%{farmerId}" />
	<s:hidden name="id" value="%{farmCrops.farm.farmer.id}" />
	<s:hidden name="tabIndexFarmer" />
	<s:hidden name="tabIndex" value="#tabs-2" />
	<s:hidden name="currentPage" />
</s:form>
<script type="text/javascript"
	src="plugins/jplayer/jquery.jplayer.min.js"></script>


<script type="text/javascript">
	var tenant = '<s:property value="getCurrentTenantId()"/>';
	var cultiArea = '<s:property value="farmCrops.cultiArea" />';
	jQuery(document)
			.ready(
					function() {
						//$("#map").css("height",$(document).height());	
						if (tenant == 'fruitmaster') {
							$("#cultiAreaKanal")
									.text(parseFloat(cultiArea) * 8);
						}
						var cropCategory = '<s:property value="farmCrops.cropCategory"/>';
						if (tenant == 'livelihood') {
							if (cropCategory == 1) {
								$('.livelihoodInter').removeClass('hide');
								$('.livelihoodMain').addClass('hide');
							} else {
								//$('.livelihoodInter').addClass('hide');
								$('.livelihoodMain').removeClass('hide');
							}

						}
						if (tenant == 'welspun') {
							$('.livelihoodMain').addClass('hide');
						}

						var url = window.location.href;
						url = url + '?id='
								+ '<s:property value="farmCrops.id"/>';

						$(".lanMenu").each(
								function() {
									var url1 = $(this).attr("href") + '&url='
											+ encodeURIComponent(url);
									$(this).attr("href", url1);
								});

						var stag = $('a[href="farm_detail.action?id=&#tabs-3"]');
						$(stag).attr("href", "javascript:onCancel();");

						var stag = $('a[href="farmer_detail.action"]');
						$(stag).attr("href", "javascript:onFarmList();");
						if (cropCategory == 1 || cropCategory == 2) {
							$('#sowDate').addClass("hide");
							$('#harvestDat').addClass("hide");
						}
						var cropPlugin = '<s:property value="cropInfoEnabled"/>';

						if (tenant != 'welspun' && tenant != 'griffith'
								&& tenant != 'simfed' && tenant != 'ecoagri') {
							$("#estimatedYieldMetTon").text(
									$("#estimatedYieldMetricTonnes").val());
						}
						var estYieldVal = $("#estimatedYieldMetricTonnes")
								.val();
						var totalValu = parseFloat(estYieldVal);
						if (cropPlugin == "1") {
							if (tenant == 'pratibha' && tenant != 'griffith'
									&& tenant != 'livelihood') {
								document
										.getElementById('estimatedYieldQuintal').innerHTML = (totalValu / 100)
										.toFixed(6);
							} else if (tenant != 'welspun'
									&& tenant != 'griffith'
									&& tenant != 'simfed'
									&& tenant != 'ecoagri'
									&& tenant != 'livelihood'
									&& tenant != 'wilmar') {
								document.getElementById('estimatedYieldMetTon').innerHTML = (totalValu / 1000)
										.toFixed(6);
							}
						}
						//}
						loadFarmCropMap();
						var cropCategory = '<s:property value="farmCrops.cropCategory"/>';
						var riskAssementVal = '<s:property value="farmCrops.riskAssesment"/>';
						if (cropCategory == "1") {
							$("#cropSeason").hide();
							$("#stapleLength").hide();
							$('#captureAssessment').hide();
							$('#riskAssesment').hide();
						} else {
							if (riskAssementVal == 1) {
								$('#captureAssessment').show();
							} else {
								$('#captureAssessment').hide();
							}
						}

						$('#update')
								.on(
										'click',
										function(e) {
											document.updateform.currentPage.value = document.form.currentPage.value;
											document.updateform.submit();
										});

						$('#delete')
								.on(
										'click',
										function(e) {
											if (confirm('<s:text name="confirm.delete"/> ')) {
												document.deleteform.currentPage.value = document.form.currentPage.value;
												document.deleteform.submit();
											}
										});
						/*   if(tenant=='griffith'){
							$('#sowDate').addClass("hide");
						} */
						renderDynamicDetailFeilds();
					});

	function onFarmList() {
		document.listForm.submit();
	}

	function getTxnType() {

		return "357";
	}

	function getBranchIdDyn() {
		return '<s:property value="farmCrops.farm.farmer.branchId"/>';
	}

	function onCancel() {
		document.cancelform.submit();
	}
</script>
<script src="plugins/openlayers/OpenLayers.js"></script>
<script type="text/javascript">
	//Variables relate to loading MAP
	try {
		var fProjection = new OpenLayers.Projection("EPSG:4326"); // Transform from WGS 1984
		var tProjection = new OpenLayers.Projection("EPSG:900913");
		var url = window.location.href;
		var temp = url;
		for (var i = 0; i < 1; i++) {
			temp = temp.substring(0, temp.lastIndexOf('/'));
		}
		var href = temp;
		var coordinateImg = "red_placemarker.png";
		var iconImage = temp + '/img/' + coordinateImg;
	} catch (err) {

	}

	function loadFarmCropMap() {
		try {
			var farmCropCordinates = jQuery("#farmCropCordinates").val();
			//alert("farmCropCordinates"+farmCropCordinates);
			//alert("farmCordinates"+farmCordinates);
			var landArea = JSON.parse(farmCropCordinates);
			if (tenant == 'livelihood') {
				var farmCordinates = jQuery("#farmCordinates").val();
				var landFarmArea = JSON.parse(farmCordinates);
				loadMapWithFarm('map',
						'<s:property value="farmCrops.latitude"/>',
						'<s:property value="farmCrops.longitude"/>', landArea,
						landFarmArea);
			} else {
				loadMap('map', '<s:property value="farmCrops.latitude"/>',
						'<s:property value="farmCrops.longitude"/>', landArea);
			}

			addExistingMarkers(landArea);
		} catch (err) {
			console.log(err);
		}
	}

	var map;
	function initMap() {

		var lat = "<s:property value="farmCrops.latitude"/>";
		var lon = "<s:property value="farmCrops.longitude"/>";
		if (isEmpty(lat) || isEmpty(lon) || lon == '' || lon == '') {

			var longtitude = "<s:property value='getLon()'/>";
			var latitude = "<s:property value='getLat()'/>";
			if (!isEmpty(longtitude) || !isEmpty(latitude) || latitude != ''
					|| longtitude != '') {
				map = new google.maps.Map(document.getElementById('map'), {
					center : {
						lat : parseFloat(latitude),
						lng : parseFloat(longtitude)
					},
					zoom : 8,
					mapTypeId : google.maps.MapTypeId.HYBRID,
				});
			} else {
				map = new google.maps.Map(document.getElementById('map'), {
					center : {
						lat : 11.0168,
						lng : 76.9558
					},
					zoom : 8,
					mapTypeId : google.maps.MapTypeId.HYBRID,
				});
			}
		} else {
			map = new google.maps.Map(document.getElementById('map'), {

				center : {
					lat : parseFloat(lat),
					lng : parseFloat(lon)
				},
				zoom : 8,
				mapTypeId : google.maps.MapTypeId.HYBRID,
			});
		}
	}

	function loadMap(mapDiv, latitude, longitude, landArea) {
		try {
			var bounds = new google.maps.LatLngBounds();
			if (!isEmpty(latitude) && !isEmpty(longitude)) {
				var marker;
				marker = new google.maps.Marker({
					position : new google.maps.LatLng(parseFloat(latitude),
							parseFloat(longitude)),
					map : map
				});
			}

			if (landArea.length > 0) {
				var cords = new Array();
				$(landArea).each(
						function(k, v) {
							if (v.lat != null && v.lat != undefined
									&& v.lon != null && v.lon != undefined) {
								cords.push({
									lat : parseFloat(v.lat),
									lng : parseFloat(v.lon)
								});
							}
							/* 	marker = new google.maps.Marker({
									position : new google.maps.LatLng(parseFloat(v.lat),
											parseFloat(v.lon)),
									map : map
								}); */
						});

				//alert(JSON.stringify(cords))

				var plotting = new google.maps.Polygon({
					paths : cords,
					strokeColor : '#FF0000',
					strokeOpacity : 0.8,
					strokeWeight : 2,
					fillColor : '#E7D874',
					fillOpacity : 0.35
				});
				plotting.setMap(map);

				/*  bounds.extend(new google.maps.LatLng(parseFloat(landArea[landArea.length-1].lat),parseFloat(landArea[landArea.length-1].lon)));
				 map.fitBounds(bounds);
				 
				 var listener = google.maps.event.addListener(map, "idle", function () {
					    map.setZoom(6);
					    google.maps.event.removeListener(listener);
					}); */

				loc = new google.maps.LatLng(cords[0].lat, cords[0].lng);
				bounds.extend(loc);
				map.fitBounds(bounds); // auto-zoom
				//map.panToBounds(bounds);    // auto-center

				var arType = '<s:property value="%{getAreaType()}" />';
				var cultiArea = '<s:property value="%{farmCrops.cultiArea}" />';

				mapLabel2 = new MapLabel({

					text : cultiArea + " " + arType,
					position : bounds.getCenter(),
					map : map,
					fontSize : 14,
					align : 'left'
				});
				mapLabel2.set('position', bounds.getCenter());

			}

		} catch (err) {
			console.log(err);
		}
	}

	function loadMapWithFarm(mapDiv, latitude, longitude, landArea,
			landFarmArea) {
		try {
			var bounds = new google.maps.LatLngBounds();
			if (!isEmpty(latitude) && !isEmpty(longitude)) {
				var marker;
				marker = new google.maps.Marker({
					position : new google.maps.LatLng(parseFloat(latitude),
							parseFloat(longitude)),
					map : map
				});
			}
			var cords = new Array();
			var plotting = [];

			if (landArea.length > 0) {
				if (landFarmArea.length > 0) {
					cords = [];

					$(landFarmArea).each(function(k, v) {
						if (v.lat != undefined && v.lon != undefined) {
							cords.push({
								lat : parseFloat(v.lat),
								lng : parseFloat(v.lon)
							});
						}
					});
					if (tenant != 'livelihood') {
						plotting.push(new google.maps.Polygon({
							paths : cords,
							strokeColor : '#FF0000',
							strokeOpacity : 0.8,
							strokeWeight : 2,
							fillColor : '#ed553e',
							fillOpacity : 0.35
						}));
						plotting[plotting.length - 1].setMap(map);
					}
				}
				if (landArea.length > 0) {
					cords = [];
				}
				$(landArea).each(
						function(k, v) {
							if (v.lat != null && v.lat != undefined
									&& v.lon != null && v.lon != undefined) {
								cords.push({
									lat : parseFloat(v.lat),
									lng : parseFloat(v.lon)
								});
							}
						});

				//alert(JSON.stringify(cords))
				if (tenant != 'livelihood') {
					plotting.push(new google.maps.Polygon({
						paths : cords,
						strokeColor : '#FF0000',
						strokeOpacity : 0.8,
						strokeWeight : 2,
						fillColor : '#a9e84a',
						fillOpacity : 0.35
					}));
					plotting[plotting.length - 1].setMap(map);
				}

				// plotting.setMap(map);

				/*  bounds.extend(new google.maps.LatLng(parseFloat(landArea[landArea.length-1].lat),parseFloat(landArea[landArea.length-1].lon)));
				 map.fitBounds(bounds);
				 
				 var listener = google.maps.event.addListener(map, "idle", function () {
					    map.setZoom(6);
					    google.maps.event.removeListener(listener);
					}); */

				loc = new google.maps.LatLng(cords[0].lat, cords[0].lng);
				bounds.extend(loc);
				map.fitBounds(bounds); // auto-zoom
				//map.panToBounds(bounds);    // auto-center

				var arType = '<s:property value="%{getAreaType()}" />';
				var cultiArea = '<s:property value="%{farmCrops.cultiArea}" />';

				mapLabel2 = new MapLabel({

					text : cultiArea + " " + arType,
					position : bounds.getCenter(),
					map : map,
					fontSize : 14,
					align : 'left'
				});
				mapLabel2.set('position', bounds.getCenter());

			}

		} catch (err) {
			console.log(err);
		}
	}

	function addExistingMarkers(jsonData) {
		var neighbouringDetails;
		$.each(jsonData, function(k, v) {

			if (v.neighbouringDetails != undefined) {
				neighbouringDetails = v.neighbouringDetails;

			}
		});

		$.each(neighbouringDetails, function(key, json) {
			//alert( key + ": " + json );
			var position = {};
			position["lat"] = Number(json.lat);
			position["lng"] = Number(json.lng);
			var marker = new google.maps.Marker({
				position : position,
				map : map,
				title : json.title,
				draggable : false,
			// label: labels[labelIndex++ % labels.length]
			});
			var contentString = '<div id="content">' + '<div id="siteNotice">'
					+ '</div>' + '<h1 id="firstHeading" class="firstHeading">'
					+ json.title + '</h1>' + '<div id="bodyContent">' + '<p>'
					+ json.description + '</p>' + '</div>' + '</div>';
			var infowindow = new google.maps.InfoWindow({
				content : contentString
			});

			//google.maps.event.addListener(marker, "rightclick", function (point) {delMarker(marker,position)});
			marker.addListener('click', function() {
				infowindow.open(map, marker);
			});

			//neighbouring_markers.push(marker);
			//neighbouring_result[json.lat+"_"+json.lng] = json;
		});

	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?client=gme-sourcetrace&v=3.33&callback=initMap"></script>
<script src="js/maplabel-compiled.js?k=2.16"></script>