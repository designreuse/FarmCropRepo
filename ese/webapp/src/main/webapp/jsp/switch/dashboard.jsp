<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="/jsp/common/form-assets.jsp"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<html>
<head>
<!-- add this meta information to select layout  -->

</head>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		loadCards();
		loadFarmerCountChartByVillage();
		loadFarmerCountChartByGroup();
		
	});

	function loadCards(){
		$.ajax({
			url : "dashboard_populateDashboardCardDetails.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$("#farmerCount").text(data.farmerCount);
				$("#farmLandCount").text(data.totalArea);
				$("#farmCount").text(data.farmCount);
				$("#mobileUserCount").text(data.mobileUserCount);
				
			}
		});	
	}
	function loadFarmerCountChartByVillage() {

		$.ajax({
			url : "dashboard_farmerInfoChartByVillage.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);

				var str = data.x_categories;
				str = str.substr(1, str.length - 2);

				var x = str.split(',');
				
				var options = {
					/* series: [{
					name: 'Farmer count',
					data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
					}, {
					name: 'Farm count',
					data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
					}, {
					name: 'Total farm area',
					data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
					}], */
					series : data.series,
					chart : {
						type : 'bar',
						height : 350
					},
					plotOptions : {
						bar : {
							horizontal : false,
							columnWidth : '55%',
							endingShape : 'rounded'
						},
					},
					dataLabels : {
						enabled : false
					},
					stroke : {
						show : true,
						width : 2,
						colors : [ 'transparent' ]
					},
					xaxis : {
						// categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
						categories : x,
					},
					yaxis : {
						title : {
							text : 'Count'
						}
					},
					fill : {
						opacity : 1
					},
					tooltip : {
						y : {
							formatter : function(val) {
								//return "$ " + val + " thousands"
								return val
							}
						}
					}
				};

				var chart = new ApexCharts(document
						.querySelector("#farmerVillageChart"), options);
				chart.render();

			}

		});

	}
	
	function loadFarmerCountChartByGroup() {

		$.ajax({
			url : "dashboard_farmerInfoChartByGroup.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);

				var str = data.x_categories;
				str = str.substr(1, str.length - 2);
				var x = str.toString().split(',');
				
				var options = {
					series : data.series,
					chart : {
						type : 'bar',
						height : 350
					},
					plotOptions : {
						bar : {
							horizontal : false,
							columnWidth : '55%',
							endingShape : 'rounded'
						},
					},
					dataLabels : {
						enabled : false
					},
					stroke : {
						show : true,
						width : 2,
						colors : [ 'transparent' ]
					},
					xaxis : {
						categories : x,
					},
					yaxis : {
						title : {
							text : 'Count'
						}
					},
					fill : {
						opacity : 1
					},
					tooltip : {
						y : {
							formatter : function(val) {
								//return "$ " + val + " thousands"
								return val
							}
						}
					}
				};

				var chart = new ApexCharts(document
						.querySelector("#farmerGroupChart"), options);
				chart.render();

			}

		});

	}
	
</script>

<body>
	<div class="row">
		<div class="col-lg-3">
			<div class="card border border-primary">
				<div class="card-header bg-transparent border-primary">
					<h5 class="my-0 text-primary">
						<i class="mdi mdi-bullseye-arrow mr-3"></i>
						<s:property value="%{getLocaleProperty('totalFarmersCount')}" />
					</h5>
				</div>
				<div class="card-body">
					<h5 class="card-title mt-0" id="farmerCount">0</h5>

				</div>
			</div>
		</div>

		<div class="col-lg-3">
			<div class="card border border-warning">
				<div class="card-header bg-transparent border-warning">
					<h5 class="my-0 text-warning">
						<i class="mdi mdi-bullseye-arrow mr-3"></i>
						<s:property value="%{getLocaleProperty('farmingTotalLand')}" />
					</h5>
				</div>
				<div class="card-body">
					<h5 class="card-title mt-0" id="farmLandCount">0</h5>

				</div>
			</div>
		</div>

		<div class="col-lg-3">
			<div class="card border border-danger">
				<div class="card-header bg-transparent border-danger">
					<h5 class="my-0 text-danger">
						<i class="mdi mdi-block-helper mr-3"></i>
						<s:property value="%{getLocaleProperty('totalFarms')}" />
					</h5>
				</div>
				<div class="card-body">
					<h5 class="card-title mt-0" id="farmCount">0</h5>

				</div>
			</div>
		</div>

		<div class="col-lg-3">
			<div class="card border border-success">
				<div class="card-header bg-transparent border-success">
					<h5 class="my-0 text-success">
						<i class="mdi mdi-check-all mr-3"></i>
						<s:property value="%{getLocaleProperty('txt.mobileUsers')}" />
					</h5>
				</div>
				<div class="card-body">
					<h5 class="card-title mt-0" id="mobileUserCount">0</h5>

				</div>
			</div>
		</div>
	</div>

	<div id="accordion" class="custom-accordion ">
		<div class="card-header card mb-1 shadow-none">
			<a href="#farmerVillageInfo" class="text-dark" data-toggle="collapse"
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
									<s:property value="%{getLocaleProperty('Farmer Details by Village')}" />
								</h3>
								<div class="wizard-desc">Farmer Basic Information Details</div>
							</div>
						</div>
						<i
							class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
					</h6>
				</div>
			</a>

		</div>

		<div id="farmerVillageInfo" class="collapse show" aria-labelledby="headingOne"
			data-parent="#accordion">
			<div class="card-body">

				<div class="row">

					<div class="col-md-12">

						<div class="form-group">
							<!--  <label for="txt"><s:property
									value="%{getLocaleProperty('info.farmer')}" /> </label> -->
							<div id="farmerVillageChart"></div>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>
	
		<div id="accordion" class="custom-accordion farm_info">
		<div class="card-header card mb-1 shadow-none">
			<a href="#farmerGroupInfo" class="text-dark" data-toggle="collapse"
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
									<s:property value="%{getLocaleProperty('Farmer Details by Group')}" />
								</h3>
								<div class="wizard-desc">Farmer Basic Information Details</div>
							</div>
						</div>
						<i
							class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
					</h6>
				</div>
			</a>

		</div>

		<div id="farmerGroupInfo" class="collapse show" aria-labelledby="headingOne"
			data-parent="#accordion">
			<div class="card-body">

				<div class="row">

					<div class="col-md-12">

						<div class="form-group">
							<!--  <label for="txt"><s:property
									value="%{getLocaleProperty('info.farmer')}" /> </label> -->
							<div id="farmerGroupChart"></div>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>

</body>