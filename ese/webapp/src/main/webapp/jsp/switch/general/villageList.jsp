<%@ include file="/jsp/common/grid-assets.jsp"%>
<!DOCTYPE html>
<html>
<head>
<META name="decorator" content="swithlayout">
</head>

<script type="text/javascript">
	$(document).ready(function() {

		loadCountryTable();
		loadStateTable();
		loadLocalityTable();
		loadCityTable();
		loadVillageTable();
		hideTables();
		
	});

	function loadCountryTable() {

		$.ajax({
					url : "village_populateCountryListData.action",
					async : false,
					type : 'post',
					success : function(result) {

						var data = JSON.parse(result);
						$('#countryTable').DataTable({
							"data" : data,
							"columns" : [ {
								title : "Code"
							}, {
								title : "Name"
							}, {
								title : "Action"
							} ]
						});

					}
				});

	}
	
	function loadStateTable() {

		$.ajax({
			url : "village_populateStateListData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#stateTable').DataTable({
					"data" : data,
					"columns" : [ {
						title : "Code"
					}, {
						title : "State Name"
					}, {
						title : "Contry Name"
					}, {
						title : "Action"
					} ]
				});

			}
		});

	}
	
	function loadLocalityTable() {

		$.ajax({
			url : "village_populateDistrictListData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#localityTable').DataTable({
					"data" : data,
					"columns" : [ {
						title : "Code"
					}, {
						title : "Locality Name"
					}, {
						title : "State Name"
					}, {
						title : "Contry Name"
					}, {
						title : "Action"
					} ]
				});

			}
		});

	}
	
	function loadCityTable(){
		$.ajax({
			url : "village_populateCityListData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#cityTable').DataTable({
					"data" : data,
					"columns" : [ {
						title : "Code"
					}, {
						title : "City Name"
					}, {
						title : "Locality Name"
					}, {
						title : "State Name"
					}, {
						title : "Contry Name"
					}, {
						title : "Action"
					} ]
				});

			}
		});
	}
	
	function loadVillageTable(){
		$.ajax({
			url : "village_populateVillageListData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#villageTable').DataTable({
					"data" : data,
					"columns" : [ {
						title : "Code"
					}, {
						title : "Village Name"
					}, {
						title : "City Name"
					}, {
						title : "Locality Name"
					}, {
						title : "State Name"
					}, {
						title : "Contry Name"
					}, {
						title : "Action"
					} ]
				});

			}
		});
	}
	
	function hideTables(){
		$("#countryCreateTable").hide();
		$("#countryUpdateTable").hide();
	}
	
	/* country related functionalities start */
	

	function openCountryCreateWindow() {
		hideTables();
		$("#countryCreateTable").show();

		$("#countryName_create").val("");

		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}
	
	function processCreateCountry(){
		var data = {
				"countryName" : $("#countryName_create").val()
			};

			$.ajax({
				url : "country_processCreateCountry.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#countryTable").DataTable().destroy();
					loadCountryTable();
					$("#model-close-btn").click();
					hideTables();
				}
			});
	}

	function openCountryEditWindow(id,obj) {
		hideTables();
		var existingCountryName = $(obj).closest('td').prev('td').text();

		$("#countryId").val(id);
		$("#countryName_update").val(existingCountryName);
		
		
		$("#countryUpdateTable").show();
		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}
	
	
	function processUpdateCountry(){
		
		var data = {
				"id" : $("#countryId").val(),
				"countryName" : $("#countryName_update").val()
			};
		
		

			$.ajax({
				url : "country_processUpdateCountry.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#countryTable").DataTable().destroy();
					loadCountryTable();
					$("#model-close-btn").click();
					hideTables();
					
					
					
					
				}
			});
	}
	/* country related functionalities end */

	function openStateEditWindow(id) {
		alert(id);
	}

	function openLocalityEditWindow(id) {
		alert(id);
	}

	function openCityEditWindow(id) {
		alert(id);
	}

	function openVillageEditWindow(id) {
		alert(id);
	}
</script>

<body>

	<!-- Nav tabs -->
	<ul class="nav nav-pills nav-justified" role="tablist">
		<li class="nav-item waves-effect waves-light"><a
			class="nav-link active  border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill" href="#country-tabs"> <span
				class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
								d="M5,3 L6,3 C6.55228475,3 7,3.44771525 7,4 L7,20 C7,20.5522847 6.55228475,21 6,21 L5,21 C4.44771525,21 4,20.5522847 4,20 L4,4 C4,3.44771525 4.44771525,3 5,3 Z M10,3 L11,3 C11.5522847,3 12,3.44771525 12,4 L12,20 C12,20.5522847 11.5522847,21 11,21 L10,21 C9.44771525,21 9,20.5522847 9,20 L9,4 C9,3.44771525 9.44771525,3 10,3 Z"
								fill="#000000"></path>
																			<rect fill="#000000" opacity="0.3"
								transform="translate(17.825568, 11.945519) rotate(-19.000000) translate(-17.825568, -11.945519)"
								x="16.3255682" y="2.94551858" width="3" height="18" rx="1"></rect>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bold text-center">Country
					Details</span>
		</a></li>
		<li class="nav-item waves-effect waves-light"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill" href="#state-tabs"> <span
				class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo3/dist/assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<rect fill="#000000" x="4" y="4" width="7" height="7"
								rx="1.5"></rect>
																			<path
								d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z"
								fill="#000000" opacity="0.3"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">State
					Details</span>
		</a></li>
		<li class="nav-item waves-effect waves-light"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill" href="#locality-tabs"> <span
				class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo3/dist/assets/media/svg/icons/Media/Movie-Lane2.svg-->
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
								d="M6,3 L18,3 C19.1045695,3 20,3.8954305 20,5 L20,19 C20,20.1045695 19.1045695,21 18,21 L6,21 C4.8954305,21 4,20.1045695 4,19 L4,5 C4,3.8954305 4.8954305,3 6,3 Z M5.5,5 C5.22385763,5 5,5.22385763 5,5.5 L5,6.5 C5,6.77614237 5.22385763,7 5.5,7 L6.5,7 C6.77614237,7 7,6.77614237 7,6.5 L7,5.5 C7,5.22385763 6.77614237,5 6.5,5 L5.5,5 Z M17.5,5 C17.2238576,5 17,5.22385763 17,5.5 L17,6.5 C17,6.77614237 17.2238576,7 17.5,7 L18.5,7 C18.7761424,7 19,6.77614237 19,6.5 L19,5.5 C19,5.22385763 18.7761424,5 18.5,5 L17.5,5 Z M5.5,9 C5.22385763,9 5,9.22385763 5,9.5 L5,10.5 C5,10.7761424 5.22385763,11 5.5,11 L6.5,11 C6.77614237,11 7,10.7761424 7,10.5 L7,9.5 C7,9.22385763 6.77614237,9 6.5,9 L5.5,9 Z M17.5,9 C17.2238576,9 17,9.22385763 17,9.5 L17,10.5 C17,10.7761424 17.2238576,11 17.5,11 L18.5,11 C18.7761424,11 19,10.7761424 19,10.5 L19,9.5 C19,9.22385763 18.7761424,9 18.5,9 L17.5,9 Z M5.5,13 C5.22385763,13 5,13.2238576 5,13.5 L5,14.5 C5,14.7761424 5.22385763,15 5.5,15 L6.5,15 C6.77614237,15 7,14.7761424 7,14.5 L7,13.5 C7,13.2238576 6.77614237,13 6.5,13 L5.5,13 Z M17.5,13 C17.2238576,13 17,13.2238576 17,13.5 L17,14.5 C17,14.7761424 17.2238576,15 17.5,15 L18.5,15 C18.7761424,15 19,14.7761424 19,14.5 L19,13.5 C19,13.2238576 18.7761424,13 18.5,13 L17.5,13 Z M17.5,17 C17.2238576,17 17,17.2238576 17,17.5 L17,18.5 C17,18.7761424 17.2238576,19 17.5,19 L18.5,19 C18.7761424,19 19,18.7761424 19,18.5 L19,17.5 C19,17.2238576 18.7761424,17 18.5,17 L17.5,17 Z M5.5,17 C5.22385763,17 5,17.2238576 5,17.5 L5,18.5 C5,18.7761424 5.22385763,19 5.5,19 L6.5,19 C6.77614237,19 7,18.7761424 7,18.5 L7,17.5 C7,17.2238576 6.77614237,17 6.5,17 L5.5,17 Z"
								fill="#000000" opacity="0.3"></path>
																			<path
								d="M11.3521577,14.5722612 L13.9568442,12.7918113 C14.1848159,12.6359797 14.2432972,12.3248456 14.0874656,12.0968739 C14.0526941,12.0460053 14.0088196,12.002002 13.9580532,11.9670814 L11.3533667,10.1754041 C11.1258528,10.0189048 10.8145486,10.0764735 10.6580493,10.3039875 C10.6007019,10.3873574 10.5699997,10.4861652 10.5699997,10.5873545 L10.5699997,14.1594818 C10.5699997,14.4356241 10.7938573,14.6594818 11.0699997,14.6594818 C11.1706891,14.6594818 11.2690327,14.6290818 11.3521577,14.5722612 Z"
								fill="#000000"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">Locality
					Details</span>
		</a></li>

		<li class="nav-item waves-effect waves-light"><a
			class="nav-link   border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill" href="#city-tabs"> <span
				class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
								d="M5,3 L6,3 C6.55228475,3 7,3.44771525 7,4 L7,20 C7,20.5522847 6.55228475,21 6,21 L5,21 C4.44771525,21 4,20.5522847 4,20 L4,4 C4,3.44771525 4.44771525,3 5,3 Z M10,3 L11,3 C11.5522847,3 12,3.44771525 12,4 L12,20 C12,20.5522847 11.5522847,21 11,21 L10,21 C9.44771525,21 9,20.5522847 9,20 L9,4 C9,3.44771525 9.44771525,3 10,3 Z"
								fill="#000000"></path>
																			<rect fill="#000000" opacity="0.3"
								transform="translate(17.825568, 11.945519) rotate(-19.000000) translate(-17.825568, -11.945519)"
								x="16.3255682" y="2.94551858" width="3" height="18" rx="1"></rect>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bold text-center">City
					Details</span>
		</a></li>

		<li class="nav-item waves-effect waves-light"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill" href="#village-tabs"> <span
				class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo3/dist/assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<rect fill="#000000" x="4" y="4" width="7" height="7"
								rx="1.5"></rect>
																			<path
								d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z"
								fill="#000000" opacity="0.3"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">Village
					Details</span>
		</a></li>

	</ul>

	<div class="tab-content p-3 text-muted">

		<div class="tab-pane active" id="country-tabs" role="tabpanel">
			<sec:authorize ifAllGranted="profile.procurementProduct.create">
				<button type="BUTTON" id="add" data-toggle='modal'
					data-target='#slide' onclick='openCountryCreateWindow();'
					class="btn btn-success mb-2 float-right">
					Add Country <i class="ri-menu-add-line align-middle ml-2"></i>
				</button>
			</sec:authorize>
			<table id="countryTable" class="display" width="100%"></table>
		</div>

		<div class="tab-pane" id="state-tabs" role="tabpanel">
			<table id="stateTable" class="display" width="100%"></table>
		</div>

		<div class="tab-pane" id="locality-tabs" role="tabpanel">
			<table id="localityTable" class="display" width="100%"></table>
		</div>

		<div class="tab-pane" id="city-tabs" role="tabpanel">
			<table id="cityTable" class="display" width="100%"></table>
		</div>

		<div class="tab-pane" id="village-tabs" role="tabpanel">
			<table id="villageTable" class="display" width="100%"></table>
		</div>

	</div>

	<div id="slide" class="modal fade bs-example-modal-center"
		role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="model-close-btn" class="close"
						data-dismiss="modal">&times;</button>
					<h4 id="cropSlideHead"></h4>
				</div>

				<div class="modal-body">

					<!-- Country create table start -->

					<table id="countryCreateTable"
						class="table table-bordered aspect-detail">

						<tr class="odd">
							<td><s:text name="Country Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="countryName_create" maxlength="20"
									cssClass="form-control" /></td>
						</tr>


						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processCreateCountry();">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- Country create table end -->
					
					
					<!-- Country update table start -->

					<table id="countryUpdateTable"
						class="table table-bordered aspect-detail">
						<s:hidden id="countryId" />
						<tr class="odd">
							<td><s:text name="Country Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="countryName_update" maxlength="20"
									cssClass="form-control" /></td>
						</tr>


						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processUpdateCountry();">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- Country update table end -->

				</div>
			</div>
		</div>
	</div>


</body>
</html>