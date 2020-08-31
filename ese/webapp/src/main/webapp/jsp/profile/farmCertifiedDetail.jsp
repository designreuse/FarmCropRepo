<%@ include file="/jsp/common/detail-assets.jsp"%>
<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<!-- add this meta information to select layout  -->
<meta name="decorator" content="swithlayout">

<style>
.hide {
	display: none;
}

.wizard-wrapper {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
}

.wizard-icon {
	font-size: 2.5rem;
	margin-right: 1.1rem;
	-webkit-transition: color 0.15s ease, background-color 0.15s ease,
		border-color 0.15s ease, -webkit-box-shadow 0.15s ease;
	transition: color 0.15s ease, background-color 0.15s ease, border-color
		0.15s ease, -webkit-box-shadow 0.15s ease;
	transition: color 0.15s ease, background-color 0.15s ease, border-color
		0.15s ease, box-shadow 0.15s ease;
	transition: color 0.15s ease, background-color 0.15s ease, border-color
		0.15s ease, box-shadow 0.15s ease, -webkit-box-shadow 0.15s ease;
}

.wizard-icon .svg-icon svg g [fill] {
	-webkit-transition: fill 0.3s ease;
	transition: fill 0.3s ease;
	fill: #B5B5C3;
}

.wizard-icon .svg-icon svg:hover g [fill] {
	-webkit-transition: fill 0.3s ease;
	transition: fill 0.3s ease;
}

.wizard-label {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
}

.wizard-label .wizard-title {
	color: #181C32;
	font-weight: 500;
	font-size: 1.1rem;
}

.wizard-label .wizard-desc {
	color: #7E8299;
}

.collapse-icon-custom {
	margin-top: -35px;
}
</style>

<!-- <script type="text/javascript" src="js/jquery.qrcode.min.js"></script> -->
</head>
<body>
	<script src="js/dynamicComponents.js?v=20.19"></script>
	<script>
		var tenant = '<s:property value="getCurrentTenantId()"/>';
		var id = '<s:property value="id"/>';
		var totalLand = '<s:property value="farm.farmDetailedInfo.totalLandHolding" />';

		jQuery(document)
				.ready(
						function() {
							/* if(window.location.href.indexOf("?id=") < 0) {
								var urll =window.location.href +"?id="+id;
								 window.location.replace(urll);
								}	 
							 */
							/* alert(tenant)
							if(tenant!="symrise"){	
							 $('.actStatus').hide(); 
							}
							var actStatuss = '<s:property value="actStatuss"/>';
							alert(actStatuss)
							if(actStatuss==1||actStatuss==2){
							$('.actStatus').hide();
							} */

							if (tenant == "fruitmaster") {

								$("#totalLandKanal").text(
										parseFloat(totalLand) * 8);

							}
							jQuery(".plantArea").show();

							if (tenant == "pratibha") {
								$(".pratibhaHide").hide();
							}
							/* if(tenant=="welspun"){
								$(".welspunHide").hide();
							} */
							loadFarmMap();

							var selectedVehicle = '<s:property value="farm.farmDetailedInfo.farmIrrigation" />';

							if (selectedVehicle != null
									&& selectedVehicle.trim() != "") {
								var value = selectedVehicle.toString().trim();
								if (value.includes(',')) {
									var values1 = value.toString().split(",");
									$.each(values1, function(i, e) {
										if (e.trim() == 2) {
											jQuery(".otherValueDiv").show();
										} else {
											jQuery(".otherValueDiv").hide();
										}
									});
								} else {
									if (value == 1) {
										jQuery(".otherValueDiv").hide();
									} else if (value == 2) {
										jQuery(".otherValueDiv").show();
									}
								}

							}

							/* var landHecVal = $("#landInAcres").val() * 0.40468564224;
							document.getElementById('landHectValues').innerHTML = landHecVal
									.toFixed(5); */

							var plantHect = $("#plantingArea").val() * 0.40468564224;
							/* document.getElementById('plantHectValues').innerHTML = plantHect
									.toFixed(5); */

							hideFields();

							jQuery.post("farm_populateHideFn.action", {},
									function(result) {
										var farmerHideFields = jQuery
												.parseJSON(result);

										$.each(farmerHideFields, function(
												index, value) {
											if (value.type == '1') {
												console.log(value.typeName);
												showByEleName(value.typeName);
											}
											if (value.type == '2') {
												showByEleId(value.typeName);
											}
											if (value.type == '3') {
												showByEleClass(value.typeName);
											}
											if (value.type == '4') {
												$("." + value.typeName)
														.removeClass("hide");
												console.log(value.typeName);
											}
											if (value.type == '5') {
												hideByEleClass(value.typeName);
											}
										});

									});

							var irrigationTypeVal = '<s:property value="irrigationSourceDetail" />';
							if (isEmpty(irrigationTypeVal)) {
								hideByEleName('farm.farmIrrigation');
							}
							if (tenant == 'wilmar') {
								var farmer = '<s:property value="farm.farmer.isCertifiedFarmer" />';
								if (farmer == 0) {
									jQuery(".organicStatusDiv").hide();
								} else {
									jQuery(".organicStatusDiv").show();
								}
							}

							renderDynamicDetailFeilds();

						});

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

		function hideByEleName(name) {
			$('[name="' + name + '"]').closest(".dynamic-flexItem2").addClass(
					"hide");
		}

		function showByEleName(name) {
			$('[name="' + name + '"]').closest(".dynamic-flexItem2")
					.removeClass("hide");
		}

		function hideByEleClass(className) {
			$("." + className).closest(".dynamic-flexItem2").addClass("hide");
		}

		function showByEleClass(className) {
			$("." + className).closest(".dynamic-flexItem2")
					.removeClass("hide");
		}

		function hideByEleId(id) {
			$("#" + id).closest(".dynamic-flexItem2").addClass("hide");
		}

		function showByEleId(id) {
			$("#" + id).closest(".dynamic-flexItem2").removeClass("hide");
		}
		function loadFarmMap() {
			try {
				var farmCoordinate = jQuery("#farmCordinates").val();
				var landArea = JSON.parse(farmCoordinate);
				loadMap('map', '<s:property value="farm.latitude"/>',
						'<s:property value="farm.longitude"/>', landArea);
				addExistingMarkers(landArea);
			} catch (err) {
				console.log(err);
			}
		}
		var map;
		function initMap() {
			const myLatLng = { lat: Number('<s:property value="farm.latitude" />'), lng: Number('<s:property value="farm.longitude" />') };
			map = new google.maps.Map(document.getElementById('map'), {
				center : myLatLng,
				zoom : 3,
				mapTypeId : google.maps.MapTypeId.HYBRID,
			});
			 new google.maps.Marker({
				    position: myLatLng,
				    map,
				    title: "Hello World!"
				  });
			 
		}
		function getTxnType() {

			return "359";
		}

		function getBranchIdDyn() {
			return '<s:property value="farm.farmer.branchId"/>';
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
					$(landArea).each(function(k, v) {
						if (v.lat != undefined && v.lon != undefined) {
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

					var plotting = new google.maps.Polygon({
						paths : cords,
						strokeColor : '#FF0000',
						strokeOpacity : 0.8,
						strokeWeight : 2,
						fillColor : '#E7D874',
						fillOpacity : 0.35
					});
					plotting.setMap(map);

					/* bounds.extend(new google.maps.LatLng(parseFloat(landArea[landArea.length-1].lat),parseFloat(landArea[landArea.length-1].lon)));
					map.fitBounds(bounds);
					
					var listener = google.maps.event.addListener(map, "idle", function () {
					  	map.setZoom(20);
					    google.maps.event.removeListener(listener);
					}); */

					loc = new google.maps.LatLng(cords[0].lat, cords[0].lng);
					bounds.extend(loc);
					map.fitBounds(bounds); // auto-zoom
					//map.panToBounds(bounds);    // auto-center

					var arType = '<s:property value="%{getAreaType()}" />';
					var cultiArea = '<s:property value="%{farm.farmDetailedInfo.totalLandHolding}" />';

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

		//Variable relate to loading Custom Popup
		var $overlay;
		var $modal;
		var $slider;
		function loadCustomPopup() {
			$overlay = $('<div id="modOverlay"></div>');
			$modal = $('<div id="modalWin" class="ui-body-c"></div>');
			$slider = $('<div id="banner-fade" style="margin:0 auto;"><ul class="bjqs"></ul></div>')
			$close = $('<button id="clsBtn" class="btnCls">X</button>');
			$modal.append($slider, $close);
			$('body').append($overlay);
			$('body').append($modal);
			$modal.hide();
			$overlay.hide();
			jQuery("#clsBtn").click(function() {
				$('#modalWin').css('margin-top', '-230px');
				$modal.hide();
				$overlay.hide();
				$('body').css('overflow', 'visible');
			});
		}

		function onCancel() {
			document.cancelform.submit();
		}
		function onUpdate() {
			document.updateform.id.value = document.getElementById('farmId').value;
			document.updateform.currentPage.value = document.form.currentPage.value;
			document.updateform.submit();
		}

		function onUpdateActPlan() {
			document.updateActform.id.value = document.getElementById('farmId').value;
			document.updateActform.isFollowUp.value = "1";
			document.updateActform.currentPage.value = document.form.currentPage.value;
			document.updateActform.submit();
		}

		function hideFields() {
			var app = $(".aPanel");
			$(app).addClass("hide");
			$(app).not(".farmerDynamicField").find(".dynamic-flexItem2").each(
					function() {
						$(this).addClass("hide");
					});

		}

		function onDelete() {
			if (confirm('<s:text name="confirm.deleteFarm"/> ')) {
				document.deleteform.id.value = document
						.getElementById('farmId').value;
				document.deleteform.currentPage.value = document.form.currentPage.value;
				document.deleteform.submit();
			}
		}

		function downloadDocument(id) {
			$("#fileId").val(id);
			//alert("ldsdg:"+$("#fileId").val(id));
			$('#documentDownload').submit();
		}

		function addExistingMarkers(jsonData) {

			var neighbouringDetails;
			$.each(jsonData, function(k, v) {

				if (v.neighbouringDetails_farm != undefined) {
					neighbouringDetails = v.neighbouringDetails_farm;

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
				var contentString = '<div id="content">'
						+ '<div id="siteNotice">' + '</div>'
						+ '<h1 id="firstHeading" class="firstHeading">'
						+ json.title + '</h1>' + '<div id="bodyContent">'
						+ '<p>' + json.description + '</p>' + '</div>'
						+ '</div>';
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
	<div class="row">
		<div class="card">
			<div class="card-body">


				<!-- Tab panes -->
				<div class="tab-content p-3 text-muted">
					<div class="tab-pane active" id="home-1" role="tabpanel">
						<s:form name="form">
							<s:hidden key="currentPage" />
							<s:hidden key="farmer.id" id="farmerId" class='uId' />
							<s:hidden key="command" />
							<s:hidden key="farmerAndContractStatus" />
							<div class="error">
								<s:actionerror theme="bootstrap" />
								<s:fielderror theme="bootstrap" />
							</div>


							<!-- Farm info start  -->
							<div id="accordion" class="custom-accordion farm_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#farmInfo" class="text-dark" data-toggle="collapse"
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
															<s:property value="%{getLocaleProperty('info.farm')}" />
														</h3>
														<div class="wizard-desc">Setup Farm Basic
															Information Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>

								<div id="farmInfo" class="collapse show"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">

										<div class="row">

											<div class="col-md-4">
												<div class="form-group farmName">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.farmName')}" /><sup
														style="color: red;">*</sup></label>
													<div class="">
														<p class="form-control" name="farm.farmName" id="farmName">
															<s:property value="farm.farmName" />
														</p>
													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group surveyNo">
													<label for="txt"><s:property
															value="%{getLocaleProperty('farm.surveyNo')}" /> </label>
													<div class="">

														<p class="form-control"
															name="farm.farmDetailedInfo.surveyNumber" id="surveyNo">
															<s:property value="farm.farmDetailedInfo.surveyNumber" />
														</p>


													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group plantArea">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.proposedPlantingArea')}" />
														(<s:property value="%{getAreaType()}" />) <sup
														style="color: red;">*</sup></label>

													<div class="">

														<p class="form-control"
															name="farm.farmDetailedInfo.proposedPlantingArea"
															id="plantingArea">
															<s:property
																value="farm.farmDetailedInfo.proposedPlantingArea" />
														</p>


													</div>
												</div>
											</div>



										</div>

										<div class="row">

											<div class="col-md-4">
												<div class="form-group landOwned">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.landOwned')}" /> <sup
														style="color: red;">*</sup>

													</label>
													<div class="">

														<p class="form-control" name="selectedFarmOwned"
															id="farmOwned">
															<s:property value="farmOwnedDetail" />
														</p>


													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group landGradient">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.landGradient')}" />
													</label>
													<div class="">


														<p class="form-control" name="selectedGradient" id="land">
															<s:property value="landGradientDetail" />
														</p>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group farmAddress">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.farmAddress')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.farmAddress" id="addressTxt">
															<s:property value="farm.farmDetailedInfo.farmAddress" />
													</div>
												</div>
											</div>
										</div>

										<div class="row">

											<div class="col-md-4">
												<p class="form-group certified">
													<s:property value="%{getLocaleProperty('farm.appRoad')}" />
												</p>
												<p class="form-control"
													name="farm.farmDetailedInfo.approachRoad">
													<s:property value="selectedRoadString" />
												</p>
											</div>



											<div class="col-md-4">
												<div class="form-group topo">
													<label for="txt"><s:property
															value="%{getLocaleProperty('farm.topo')}" /> </label>
													<div class="">
														<p class="form-control" name="farm.landTopology">
															<s:property value="farm.landTopology" />
														</p>

													</div>
												</div>
											</div>
											<!--  <div class="col-md-4">
												<div class="form-group farmAddress">
													<label for="txt"><s:property
															value="%{getLocaleProperty('organicStatus')}" /> </label>
													<div class="">
														<s:textfield id="organicStatus"
															name="farm.farmIcsConv.organicStatus"
															cssClass="form-control" />
													</div>
												</div>
											</div>  -->

											<div class="col-md-4">
												<div class="form-group totalLand">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.totalLand')}" />(<s:property
															value="%{getAreaType()}" />) <sup style="color: red;">*</sup>
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.totalLandHolding">
															<s:property
																value="farm.farmDetailedInfo.totalLandHolding" />
														</p>

													</div>
												</div>
											</div>
										</div>





									</div>
								</div>
							</div>
							<!-- Farm info end -->

							<!-- Soil and irrigation start  -->

							<div id="accordion" class="custom-accordion soil_Irrigation_Info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#soil_Irrigation_Info" class="text-dark"
										data-toggle="collapse" aria-expanded="true"
										aria-controls="collapseTwo">
										<div class="card-header" id="headingTwo">
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
															<s:property value="%{getLocaleProperty('info.soil')}" />
														</h3>
														<div class="wizard-desc">Setup Soil and Irrigation
															Information Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>

								<div id="soil_Irrigation_Info" class="collapse show"
									aria-labelledby="headingTwo" data-parent="#accordion">
									<div class="card-body">

										<div class="row">

											<div class="col-md-4">
												<div class="form-group soilType">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.soilType')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.soilType">
															<s:property value="soilTypeDetail" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group soilTexture">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.soilTexture')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.soilTexture">
															<s:property value="soilTextureDetail" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group soilFertilityStatus">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.soilFertilityStatus')}" />
													</label>

													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.soilFertility">
															<s:property value="soilFertilityDetail" />
														</p>
													</div>
												</div>
											</div>



										</div>

										<div class="row">

											<div class="col-md-4">
												<div class="form-group farmIrrigationSource">
													<label for="txt"> <%-- <s:text name="farm.farmIrrigationSource" /> --%>
														<s:property
															value="%{getLocaleProperty('farm.farmIrrigationSource')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.irrigationSource">
															<s:property value="irrigationSourceDetail" />
														</p>
													</div>
												</div>
											</div>
											<div class="col-md-4" id="farmIrrigationType">
												<div class="form-group farmIrrigationType">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.farmIrrigationType')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.irrigationSource">
															<s:property value="irrigationSourceDetail" />
														</p>

													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group methodOfIrrigation">
													<label for="txt"><s:text
															name="farm.methodOfIrrigation" /> </label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.methodOfIrrigation">
															<s:property value="methodOfIrrigationDetail" />
														</p>

													</div>
												</div>
											</div>
										</div>



									</div>
								</div>
							</div>

							<!-- Soil and irrigation end  -->

							<!-- conversion_Info start -->

							<div id="accordion" class="custom-accordion conversion_Info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#conversion_Info" class="text-dark"
										data-toggle="collapse" aria-expanded="true"
										aria-controls="collapseThree">
										<div class="card-header" id="headingThree">
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
															<s:property
																value="%{getLocaleProperty('info.conversion')}" />
														</h3>
														<div class="wizard-desc">Setup Conversion
															Information Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>

								<div id="conversion_Info" class="collapse show"
									aria-labelledby="headingThree" data-parent="#accordion">
									<div class="card-body">

										<div class="row">

											<div class="col-md-4">
												<div class="form-group lastDateofChemicalApply">
													<label for="txt"><s:property
															value="%{getLocaleProperty('farm.lastDateofChemicalApply')}" />
													</label>

													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.lastDateOfChemicalApplication">
															<s:property
																value="farm.farmDetailedInfo.lastDateOfChemicalApplication" />
														</p>
													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group conventionalLands">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.conventionalLands')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.conventionalLand">
															<s:property
																value="farm.farmDetailedInfo.conventionalLand" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group fallowLand">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.fallowLand')}" />
													</label>

													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.fallowOrPastureLand">
															<s:property
																value="farm.farmDetailedInfo.fallowOrPastureLand" />
														</p>

													</div>
												</div>
											</div>



										</div>

										<div class="row">

											<div class="col-md-4">
												<div class="form-group conventionalCrops">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.conventionalCrops')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.conventionalCrops">
															<s:property
																value="farm.farmDetailedInfo.conventionalCrops" />
														</p>

													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group conventionalEstimatedYields">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.conventionalEstimatedYields')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.conventionalEstimatedYield">
															<s:property
																value="farm.farmDetailedInfo.conventionalEstimatedYield" />
														</p>

													</div>
												</div>
											</div>

										</div>




									</div>
								</div>
							</div>
							<!-- conversion_Info end -->

							<!-- field_History_Info start -->

							<div id="accordion" class="custom-accordion field_History_Info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#field_History_Info" class="text-dark"
										data-toggle="collapse" aria-expanded="true"
										aria-controls="collapseFour">
										<div class="card-header" id="headingFour">
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
															<s:property
																value="%{getLocaleProperty('Fiel History Details')}" />
														</h3>
														<div class="wizard-desc">Setup Field History
															Information Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>

								<div id="field_History_Info" class="collapse show"
									aria-labelledby="headingFour" data-parent="#accordion">
									<div class="card-body">

										<div class="row">

											<div class="col-md-4">
												<div class="form-group fieldName">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.fieldName')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.fieldName">
															<s:property value="farm.farmDetailedInfo.fieldName" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group fieldCrop">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.fieldCrop')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.fieldCrop">
															<s:property value="farm.farmDetailedInfo.fieldCrop" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group fieldArea">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.area')}" />
													</label>

													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.fieldArea">
															<s:property value="farm.farmDetailedInfo.fieldArea" />
														</p>

													</div>
												</div>
											</div>



										</div>

										<div class="row">

											<div class="col-md-4">
												<div class="form-group inputApplied">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.inputApplied')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.inputApplied">
															<s:property value="farm.farmDetailedInfo.inputApplied" />
														</p>

													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group quantityApplied">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.quantity')}" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.quantityApplied">
															<s:property value="farm.farmDetailedInfo.quantityApplied" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group lastDateOfChemicalString">
													<label for="txt"><s:property
															value="%{getLocaleProperty('farm.lastDateofChemicalApply')}" /></label>
													<div class="">
														<p class="form-control"
															name="farm.farmDetailedInfo.lastDateOfChemicalString">
															<s:property
																value="farm.farmDetailedInfo.lastDateOfChemicalString" />
														</p>

													</div>
												</div>
											</div>

										</div>




									</div>
								</div>
							</div>

							<!-- field_History_Info end -->


							<!--  farmICS_info start -->

							<div id="accordion" class="custom-accordion farmICS_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#farmICS_info" class="text-dark"
										data-toggle="collapse" aria-expanded="true"
										aria-controls="collapseFive">
										<div class="card-header" id="headingFive">
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
															<s:property value="%{getLocaleProperty('info.ics')}" />
														</h3>
														<div class="wizard-desc">Setup Land ICS Information
															Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>

								<div id="farmICS_info" class="collapse show"
									aria-labelledby="headingFive" data-parent="#accordion">
									<div class="card-body">

										<div class="row">

											<div class="col-md-4">
												<div class="form-group certType">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('certType')}" /><sup
														style="color: red;">*</sup>
													</label>
													<div class="">
														<p class="form-control" name="farm.farmIcsConv.scope">
															<s:property value="scopeName" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group conversionStatus">
													<label for="txt"><s:text
															name="%{getLocaleProperty('conversionStatus')}" /><sup
														style="color: red;">*</sup> </label>
													<div class="">
														<p class="form-control" name="farm.farmIcsConv.icsType">
															<s:property value="farm.farmIcsConv.icsType" />
														</p>

													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group inspectionDate">
													<label for="txt"> <s:text name="inspectionDate" />
													</label>

													<div class="">
														<p class="form-control"
															name="farm.farmIcsConv.inspectionDateString">
															<s:property value="farm.farmIcsConv.inspectionDateString" />
														</p>

													</div>
												</div>
											</div>



										</div>

										<div class="row">

											<div class="col-md-4">
												<div class="form-group nameOfInspector">
													<label for="txt"> <s:text name="nameOfInspector" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmIcsConv.inspectorName">
															<s:property value="farm.farmIcsConv.inspectorName" />
														</p>

													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group qualified">
													<label for="txt"> <s:text
															name="%{getLocaleProperty('qualified')}" />
													</label>
													<div class="">
														<s:radio id="sTesing" list="qualifiedTestMap"
															name="farm.farmIcsConv.qualified" listKey="key"
															onchange="setQualified(this.value)" listValue="value" />
													</div>
												</div>
											</div>

											<div class="col-md-4 qualNo hide">
												<div class="form-group sanctionReason">
													<label for="txt"><s:text name="sanctionReason" /></label>
													<div class="">
														<p class="form-control"
															name="farm.farmIcsConv.sanctionreason">
															<s:property value="farm.farmIcsConv.sanctionreason" />
														</p>

													</div>
												</div>
											</div>

										</div>

										<div class="row">

											<div class="col-md-4 qualNo hide">
												<div class="form-group durationOfSanction">
													<label for="txt"> <s:text name="durationOfSanction" />
													</label>
													<div class="">
														<p class="form-control"
															name="farm.farmIcsConv.sanctionDuration">
															<s:property value="farm.farmIcsConv.sanctionDuration" />
														</p>


													</div>
												</div>
											</div>
										</div>


									</div>
								</div>
							</div>

							<!--  farmICS_info end -->

							<!-- gps_Info start -->

							<div id="accordion" class="custom-accordion gps_Info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#gps_Info" class="text-dark" data-toggle="collapse"
										aria-expanded="true" aria-controls="collapseSix">
										<div class="card-header" id="headingSix">
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
															<s:property value="%{getLocaleProperty('gps.prop')}" />
														</h3>
														<div class="wizard-desc">Setup GPS Information
															Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>

								<div id="gps_Info" class="collapse show"
									aria-labelledby="headingSix" data-parent="#accordion">
									<div class="card-body">

										<div class="row">

											<div class="col-md-4">
												<div class="form-group latitude">
													<label for="txt"><s:text name="farm.latitude" /> </label>
													<div class="">
														<s:textfield name="farm.latitude" maxlength="20"
															cssClass="form-control " />
													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group longitude">
													<label for="txt"><s:text name="farm.longitude" />
													</label>
													<div class="">
														<s:textfield name="farm.longitude" maxlength="20"
															cssClass="form-control " />
													</div>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group landmark">
													<label for="txt"> <s:property
															value="%{getLocaleProperty('farm.landmark')}" />
													</label>

													<div class="">
														<s:textfield name="farm.landmark" maxlength="100"
															cssClass="form-control " />
													</div>
												</div>
											</div>



										</div>

										<div class="row">


											<div class="col-md-4">
												<p class="form-group ">
													<s:property value="%{getLocaleProperty('farm.photo')}" />
												</p>

												<img src="assets/images/product/img-1.png" alt=""
													class="img-fluid mx-auto d-block"
													data-zoom="assets/images/product/img-1.png">


											</div>

											<div class="col-md-8">
												<p class="form-group ">
													<s:property value="%{getLocaleProperty('Farm location')}" />
												</p>
												<s:hidden id="farmCordinates" value="%{jsonObjectList}" />
												<div id="map" class="smallmap map" style="height: 250px"></div>

												<p id="latlonStr">
													<s:property value="farm.latitude" />
													:
													<s:property value="farm.longitude" />
												</p>
											</div>

										</div>


									</div>
								</div>
							</div>

							<!-- gps_Info end  -->


							<div id="accordion" class="custom-accordion farmer_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#farmerInfo" class="text-dark" data-toggle="collapse"
										aria-expanded="true" aria-controls="collapseThree">
										<div class="card-header" id="headingThree">
											<h6 class="m-0">
												<div class="wizard-wrapper">
													<div class="wizard-icon">
														<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
															<svg xmlns="http://www.w3.org/2000/svg"
																xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																	fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
																	d="M12,21 C7.02943725,21 3,16.9705627 3,12 C3,7.02943725 7.02943725,3 12,3 C16.9705627,3 21,7.02943725 21,12 C21,16.9705627 16.9705627,21 12,21 Z M14.1654881,7.35483745 L9.61055177,10.3622525 C9.47921741,10.4489666 9.39637436,10.592455 9.38694497,10.7495509 L9.05991526,16.197949 C9.04337012,16.4735952 9.25341309,16.7104632 9.52905936,16.7270083 C9.63705011,16.7334903 9.74423017,16.7047714 9.83451193,16.6451626 L14.3894482,13.6377475 C14.5207826,13.5510334 14.6036256,13.407545 14.613055,13.2504491 L14.9400847,7.80205104 C14.9566299,7.52640477 14.7465869,7.28953682 14.4709406,7.27299168 C14.3629499,7.26650974 14.2557698,7.29522855 14.1654881,7.35483745 Z"
																	fill="#000000"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>

													</div>
													<div class="wizard-label">

														<h3 class="wizard-title">
															<s:property
																value="%{getLocaleProperty('ICS Information')}" />
														</h3>
														<div class="wizard-desc">Get Farmer ICS Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>

								<div class="card-body">

									<div class="row">



										<div class="col-md-4">
											<p class="form-group certified">
												<s:property
													value="%{getLocaleProperty('farmer.isCertified')}" />
											</p>
											<p class="form-control" name="farmer.isCertifiedFarmer">
												<s:property
													value="isFarmerCertified[farmer.isCertifiedFarmer]" />
											</p>
										</div>


										<%-- 		<div class="col-md-4">
				<p class="form-group icsFieldSelect">
					<s:property value="%{getLocaleProperty('farmer.icsName')}" />
				</p>
				<p class="form-control" name="farmer.icsName">
					<s:property value="farmer.icsName" />
				</p>
			</div>--%>

										<div class="col-md-4">
											<p class="form-group ">
												<s:property value="%{getLocaleProperty('farmer.icsName')}" />
											</p>
											<p class="form-control" name="farmer.icsName">
												<s:property value="icsName" />
											</p>
										</div>

										<div class="col-md-4">
											<p class="form-group ">
												<s:property value="%{getLocaleProperty('farmer.icsCode')}" />
											</p>
											<p class="form-control" name="farmer.icsCode">
												<s:property value="farmer.icsCode" />
											</p>
										</div>
										<s:if test="farmer.isCertifiedFarmer==1">
											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('certification.type')}" />
												</p>
												<p class="form-control" name="farmer.certificationType">
													<s:property
														value="certificationTypes[farmer.certificationType]" />
												</p>
											</div>
										</s:if>

									</div>



								</div>
							</div>













							<!-- need to be deleted start -->
							<div id="accordion" class="custom-accordion other_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#otherInfo" class="text-dark" data-toggle="collapse"
										aria-expanded="true" aria-controls="collapseFour">
										<div class="card-header" id="headingFour">
											<h6 class="m-0">
												<div class="wizard-wrapper">
													<div class="wizard-icon">
														<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
															<svg xmlns="http://www.w3.org/2000/svg"
																xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																	fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
																	d="M19,11 L21,11 C21.5522847,11 22,11.4477153 22,12 C22,12.5522847 21.5522847,13 21,13 L19,13 C18.4477153,13 18,12.5522847 18,12 C18,11.4477153 18.4477153,11 19,11 Z M3,11 L5,11 C5.55228475,11 6,11.4477153 6,12 C6,12.5522847 5.55228475,13 5,13 L3,13 C2.44771525,13 2,12.5522847 2,12 C2,11.4477153 2.44771525,11 3,11 Z M12,2 C12.5522847,2 13,2.44771525 13,3 L13,5 C13,5.55228475 12.5522847,6 12,6 C11.4477153,6 11,5.55228475 11,5 L11,3 C11,2.44771525 11.4477153,2 12,2 Z M12,18 C12.5522847,18 13,18.4477153 13,19 L13,21 C13,21.5522847 12.5522847,22 12,22 C11.4477153,22 11,21.5522847 11,21 L11,19 C11,18.4477153 11.4477153,18 12,18 Z"
																	fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<circle fill="#000000" opacity="0.3" cx="12" cy="12"
																	r="2"></circle>
																			<path
																	d="M12,17 C14.7614237,17 17,14.7614237 17,12 C17,9.23857625 14.7614237,7 12,7 C9.23857625,7 7,9.23857625 7,12 C7,14.7614237 9.23857625,17 12,17 Z M12,19 C8.13400675,19 5,15.8659932 5,12 C5,8.13400675 8.13400675,5 12,5 C15.8659932,5 19,8.13400675 19,12 C19,15.8659932 15.8659932,19 12,19 Z"
																	fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>

													</div>
													<div class="wizard-label">

														<h3 class="wizard-title">
															<s:property
																value="%{getLocaleProperty('Other Information')}" />
														</h3>
														<div class="wizard-desc">Get Other Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>
								<div id="otherInfo" class="collapse show"
									aria-labelledby="headingFour data-parent="#accordion">
									<div class="card-body">

										<div class="row">


											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.noOfFamilyMembers.prop')}" />
												</p>
												<p class="form-control" name="farmer.noOfFamilyMembers">
													<s:property value="farmer.noOfFamilyMembers" />
												</p>
											</div>

											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.housingOwnershipProp')}" />
												</p>

												<p class="form-control"
													name="farmer.farmerEconomy.housingOwnershipOther">
													<s:property
														value="farmer.farmerEconomy.housingOwnershipOther" />
												</p>




											</div>



											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.housingTypeProp')}" />
												</p>
												<p class="form-control"
													name="farmer.farmerEconomy.housingType">
													<s:property
														value="housingTypeList[farmer.farmerEconomy.housingType]" />
												</p>
											</div>




											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.drinkingWSProp')}" />
												</p>
												<p class="form-control"
													name="farmer.farmerEconomy.drinkingWaterSource">
													<s:property
														value="farmer.farmerEconomy.drinkingWaterSource" />
												</p>
											</div>
											<div class="col-md-4">
												<p class="form-group ">
													<s:property value="%{getLocaleProperty('farmer.life')}" />
												</p>
												<p class="form-control" name="farmer.lifeInsurance">
													<s:property value="farmer.lifeInsurance" />
												</p>
											</div>
											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.isLoanTakenLastYearProp')}" />
												</p>
												<p class="form-control" name="farmer.loanTakenLastYear">
													<s:if test="farmer.loanTakenLastYear==1">
														<s:text name="yes" />
													</s:if>

													<s:else>
														<s:text name="no" />
													</s:else>
												</p>
											</div>
										</div>



									</div>
								</div>


							</div>
							<!-- need to be deleted end -->
							<div class="dynamicFieldsRender"></div>



							<!-- btn start  -->
							<div class="flexItem flex-layout flexItemStyle float-right">
								<div class="">
									<sec:authorize ifAllGranted="profile.farmer.update">

										<span id="update" class=""><span class="first-child">
												<button type="button" class="edit-btn btn btn-success"
													onclick="onUpdate()">
													<i class="ri-check-line align-middle mr-2"></i> <FONT
														color="#FFFFFF"> <b><s:text name="edit.button" /></b>
													</font>
												</button>
										</span></span>

										<%-- <span id="update" class=""><span class="first-child actStatus">
									<button type="button" class="edit-btn btn btn-success"
										onclick="onUpdateActPlan()">
										<FONT color="#FFFFFF"> <b><s:text
													name="followup.button" /></b>
										</font>
									</button>
							</span></span> --%>
									</sec:authorize>
									<sec:authorize ifAllGranted="profile.farmer.delete">

										<span id="delete" class=""><span class="first-child">
												<button type="button" onclick="onDelete()"
													class="delete-btn btn btn-warning">
													<i class="ri-close-line align-middle mr-2"></i> <FONT
														color="#FFFFFF"> <b><s:text
																name="delete.button" /></b>
													</font>

												</button>
										</span></span>

									</sec:authorize>
									<span id="cancel" class=""><span class="first-child">
											<button type="button" class="back-btn btn btn-primary"
												onclick="onCancel()">
												<i class="ri-error-warning-line align-middle mr-2"></i> <b><FONT
													color="#FFFFFF"><s:text name="back.button" /> </font></b>
											</button>
									</span></span>
								</div>
							</div>
							<!-- btn end  -->


						</s:form>
					</div>
					<s:form name="updatfrm" action="farmer_update.action">
						<s:hidden key="id" />
						<s:hidden name="farmerName" value="%{farmerName}" />
						<s:hidden name="farmerCode" value="%{farmerCode}" />
						<s:hidden key="currentPage" />
						<s:hidden name="type" class="type" />
					</s:form>
					<s:form name="deleteform" action="farmer_delete.action">
						<s:hidden key="id" />
						<s:hidden key="farmerImageByteString" />
						<s:hidden key="currentPage" />
					</s:form>
					<s:form name="approveform" action="farmer_approve.action">
						<s:hidden key="id" />
						<s:hidden key="farmerImageByteString" />
						<s:hidden key="currentPage" />
					</s:form>

					<s:form id="cancelform" name="cancelform"
						action="farmer_list.action">
						<s:hidden key="id" />
						<s:hidden key="currentPage" />
						<s:hidden name="postdata" id="postdata" />
					</s:form>
					<s:form name="redirectform"
						action="distributionAgentLogin_execute.action" method="get">
						<s:hidden key="type" value="distribution" id='type' />
						<s:hidden key="fId" />
					</s:form>
					<div class="tab-pane" id="profile-1" role="tabpanel">
						<div id="errorDiv" style="color: red;">
							<s:if test='#session.farmcropsExist!=null'>
								<ul style="list-style-type:">
									<li><%=(String) request.getSession().getAttribute("farmcropsExist")%>
									</li>
								</ul>
							</s:if>
							<%
								request.getSession().removeAttribute("farmcropsExist");
							%>
						</div>

						<sec:authorize ifAllGranted="profile.farmer.create">
							<button type="BUTTON" id="add"
								onclick="document.createform.submit()"
								class="btn btn-success mb-2 float-right">
								Add Farm<i class="ri-menu-add-line align-middle ml-2"></i>
							</button>
						</sec:authorize>
						<div>
							<div class="table-responsive mt-3" id="baseDiv1">
								<table
									class="table table-centered datatable dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;"
									id="detail1"></table>
								<div id="pagerForDetail1"></div>
							</div>
						</div>
						<s:form name="createform" action="farm_create">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="farmerUniqueId" value="%{farmer.id}" />
							<s:hidden name="farmerName" value="%{farmer.name}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="branch" value="%{farmer.branchId}" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="farmdetailform" action="farm_detail">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="farmerUniqueId" value="%{farmer.id}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="id" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="farmupdatfrm" action="farm_update">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="farmerUniqueId" value="%{farmer.id}" />
							<s:hidden name="farmerName" value="%{farmer.name}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="id" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="farmdeleteform" action="farm_delete">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="id" />
							<s:hidden name="tabIndex" />
						</s:form>
					</div>
					<div class="tab-pane" id="messages-1" role="tabpanel">


						<sec:authorize ifAllGranted="profile.farmer.create">
							<button type="BUTTON" id="add" onclick="addfarmCrop()"
								class="btn btn-success mb-2 float-right">
								Add Farm Crop<i class="ri-menu-add-line align-middle ml-2"></i>
							</button>
						</sec:authorize>


						<div>
							<div class="table-responsive mt-3" id="baseDiv">
								<table
									class="table table-centered datatable dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;"
									id="cropDetail"></table>
								<div id="cropPagerForDetail"></div>
							</div>
						</div>


						<s:form name="cropCreateform" action="farmCrops_create.action">
							<s:hidden name="farmId" value="%{farm.id}" />
							<s:hidden name="farmName" value="%{farm.farmName}" />
							<s:hidden name="farmerId" value="%{farmer.id}" />
							<s:hidden name="farmerName" value="%{farm.farmer.name}" />
							<s:hidden name="branch" value="%{farm.farmer.branchId}" />
							<%-- <s:hidden name="tabIndexz" value="#tabs-5" /> --%>
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="detailfarmCrops" action="farmCrops_detail">
							<s:hidden name="farmId" value="%{farm.id}" />
							<s:hidden name="farmerId" value="%{farm.farmer.farmerId}" />
							<s:hidden name="farmerName" value="%{farm.farmer.name}" />
							<s:hidden name="farmName" value="%{farm.farmName}" />
							<s:hidden name="tabIndexz" value="#tabs-3" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
							<s:hidden name="id" />
						</s:form>

					</div>
					<div class="tab-pane" id="settings-1" role="tabpanel">
						<p class="mb-0">Trust fund seitan letterpress, keytar raw
							denim keffiyeh etsy art party before they sold out master cleanse
							gluten-free squid scenester freegan cosby sweater. Fanny pack
							portland seitan DIY, art party locavore wolf cliche high life
							echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi
							before they sold out farm-to-table.</p>
					</div>
				</div>

			</div>
		</div>
	</div>


	<s:form name="updateform" action="farm_update.action">
		<s:hidden name="id" value="%{farm.id}" />
		<s:hidden key="currentPage" />
		<s:hidden name="farmerId" value="%{farmerId}" />
		<s:hidden name="sangham" value="%{farm.farmer.sangham}" />
		<s:hidden name="tabIndexFarmer" value="%{tabIndex}" />
		<s:hidden id="isFollowUp" name="isFollowUp" />
	</s:form>
	<s:form name="updateActform" action="farm_updateActPlan.action">
		<s:hidden name="id" value="%{farm.id}" />
		<s:hidden key="currentPage" />
		<s:hidden name="farmerId" value="%{farmerId}" />
		<s:hidden name="sangham" value="%{farm.farmer.sangham}" />
		<s:hidden name="tabIndexFarmer" value="%{tabIndex}" />
		<s:hidden id="isFollowUp" name="isFollowUp" />
	</s:form>
	<s:form name="deleteform" action="farm_delete.action">
		<s:hidden key="id" />
		<s:hidden key="currentPage" />
		<s:hidden name="farmerId" value="%{farmerId}" />
		<s:hidden name="sangham" value="%{farm.farmer.sangham}" />
		<s:hidden name="tabIndexFarmer" value="%{tabIndexFarmerZ}" />
		<s:hidden value="%{farm.farmer.id}" name="farmerUniqueId" />
	</s:form>
	<s:form name="cancelform" action="farmer_detail.action">
		<s:hidden name="farmerId" />
		<s:hidden name="id" value="%{farmerUniqueId}" />
		<s:hidden name="tabIndex" value="%{tabIndexFarmerZ}" />
		<s:hidden name="currentPage" />
	</s:form>
	<s:form name="redirectform" action="farmInventory_list.action">
		<s:hidden name="farmId" value="%{farm.id}" />
		<s:hidden key="currentPage" />
	</s:form>
	<s:form name="redirectforms" action="animalHusbandary_list.action">
		<s:hidden name="farmId" value="%{farm.id}" />
		<s:hidden key="currentPage" />


	</s:form>

	<s:form id="audioFileDownload" action="farm_populateDownload.action">
		<s:hidden id="loadId" name="id" />
	</s:form>
	<s:form id="documentDownload" action="farm_populateDownloadFile">
		<s:hidden id="fileId" name="documentFileId" />
	</s:form>


<s:hidden key="farm.id" id="farmId"  class="uId"/>
				<s:form name="form">
					<s:hidden key="currentPage" />
					<s:hidden key="id" />
					<s:hidden key="farm.id" />
					<s:hidden value="dateOfInspection" />
					<s:hidden key="farm.lockExist" id="locked" />
					<s:hidden key="command" />
					<s:hidden id="landInAcres" name="landInAcres"
						value="%{farm.farmDetailedInfo.totalLandHolding}" />
					<s:hidden id="plantingArea" name="plantingArea"
						value="%{farm.farmDetailedInfo.proposedPlantingArea}" />
				</s:form>

	<!-- JAVASCRIPT -->
	<script src="assets/libs/jquery/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/libs/metismenu/metisMenu.min.js"></script>
	<script src="assets/libs/simplebar/simplebar.min.js"></script>
	<script src="assets/libs/node-waves/waves.min.js"></script>

	<script src="assets/js/app.js"></script>

	<script src="plugins/jqgrid/js/i18n/grid.locale-en.js"
		type="text/javascript"></script>
	<script src="plugins/jqgrid/js/jquery.jqGrid.min.js"
		type="text/javascript"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?client=gme-sourcetrace&v=3.33&callback=initMap"></script>
</body>


