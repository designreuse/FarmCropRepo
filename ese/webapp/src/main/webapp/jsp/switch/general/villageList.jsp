<%@ include file="/jsp/common/grid-assets.jsp"%>
<!DOCTYPE html>
<html>
<head>
<META name="decorator" content="swithlayout">
<!-- JAVASCRIPT -->
<script src="assets/libs/jquery/jquery.min.js"></script>
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/libs/metismenu/metisMenu.min.js"></script>
<script src="assets/libs/simplebar/simplebar.min.js"></script>
<script src="assets/libs/node-waves/waves.min.js"></script>
<script src="assets/js/app.js"></script>
<!-- Required datatable js -->
<script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<!-- Buttons examples -->
<script
	src="assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="assets/libs/jszip/jszip.min.js"></script>
<script src="assets/libs/pdfmake/build/pdfmake.min.js"></script>
<script src="assets/libs/pdfmake/build/vfs_fonts.js"></script>
<script src="assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
<script
	src="assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>

<script
	src="assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script
	src="assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>

<!-- Responsive examples -->
<script
	src="assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

<!-- Datatable init js -->
<script src="assets/js/pages/datatables.init.js"></script>
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
					"order" : [],
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
					"order" : [],
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
					"order" : [],
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

	function loadCityTable() {
		$.ajax({
			url : "village_populateCityListData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#cityTable').DataTable({
					"data" : data,
					"order" : [],
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

	function loadVillageTable() {
		$.ajax({
			url : "village_populateVillageListData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#villageTable').DataTable({
					"data" : data,
					"order" : [],
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

	function hideTables() {
		$("#countryCreateTable").hide();
		$("#countryUpdateTable").hide();
		$("#stateCreateTable").hide();
		$("#stateUpdateTable").hide();
		$("#localityCreateTable").hide();
		$("#localityUpdateTable").hide();
		$("#cityCreateTable").hide();
		$("#cityUpdateTable").hide();
		$("#villageCreateTable").hide();
		$("#villageUpdateTable").hide();
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

	function processCreateCountry(obj) {
		$(obj).prop('disabled', true);
		var countryName = $("#countryName_create").val();

		if (!isEmpty(countryName)) {

			var data = {
				"countryName" : countryName
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
					reloadCountryDropDown();
					$(obj).prop('disabled', false);
				}
			});
		} else {
			alert("Country Name is empty");
			$(obj).prop('disabled', false);
		}

	}

	function openCountryEditWindow(id, obj) {
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

	function processUpdateCountry(obj) {
		$(obj).prop('disabled', true);
		var countryName = $("#countryName_update").val();

		if (!isEmpty(countryName)) {

			var data = {
				"id" : $("#countryId").val(),
				"countryName" : countryName
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
					reloadCountryDropDown();
					$(obj).prop('disabled', false);

				}
			});
		} else {
			alert("Country Name is empty");
			$(obj).prop('disabled', false);
		}

	}
	/* country related functionalities end */

	/* state related functionalities start  */

	function openStateCreateWindow() {
		hideTables();
		$("#stateCreateTable").show();

		$("#stateName_create").val("");
		$('#selectedCountry_create option').prop('selected', function() {
			return this.defaultSelected;
		});

		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processCreateState(obj) {
		$(obj).prop('disabled', true);
		var country = $("#selectedCountry_create").val();
		var stateName = $("#stateName_create").val();

		if (!isEmpty(stateName) && !isEmpty(country) && country != '-1') {
			var data = {
				"selectedCountry" : country,
				"stateName" : stateName
			};

			$.ajax({
				url : "state_processCreateState.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#stateTable").DataTable().destroy();
					loadStateTable();
					$("#model-close-btn").click();
					hideTables();

					/* $('#selectedCountry_create option').prop('selected',
							function() {
								return this.defaultSelected;
							}); */
					reloadStateDropDown();
					$(obj).prop('disabled', false);
				}
			});
		} else if (isEmpty(stateName)) {
			alert("State Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(country) || country == '-1') {
			alert("Country is empty");
			$(obj).prop('disabled', false);
		}

	}

	function openStateEditWindow(id, obj) {
		hideTables();
		var existingStateName = $(obj).closest('td').prev('td').prev('td')
				.text();

		$("#stateId").val(id);
		$("#stateName_update").val(existingStateName);
		$('#selectedCountry_update option').prop('selected', function() {
			return this.defaultSelected;
		});

		$("#stateUpdateTable").show();
		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processUpdateState(obj) {
		$(obj).prop('disabled', true);
		var country = $("#selectedCountry_update").val();
		var stateName = $("#stateName_update").val();

		if (!isEmpty(stateName) && !isEmpty(country) && country != '-1') {
			var data = {
				"id" : $("#stateId").val(),
				"selectedCountry" : $("#selectedCountry_update").val(),
				"stateName" : $("#stateName_update").val()
			};

			$.ajax({
				url : "state_processUpdateState.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#stateTable").DataTable().destroy();
					loadStateTable();
					$("#model-close-btn").click();
					hideTables();
					/* $('#selectedCountry_update option').prop('selected',
							function() {
								return this.defaultSelected;
							}); */

					reloadStateDropDown();
					$(obj).prop('disabled', false);

				}
			});
		} else if (isEmpty(stateName)) {
			alert("State Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(country) || country == '-1') {
			alert("Country is empty");
			$(obj).prop('disabled', false);
		}

	}

	/*  state related functionalities end */

	/* locality related functionalities start */

	function openLocalityCreateWindow() {
		hideTables();
		$("#localityCreateTable").show();

		$("#localityName_create").val("");

		$('#selectedState_create option').prop('selected', function() {
			return this.defaultSelected;
		});

		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processCreateLocality(obj) {
		$(obj).prop('disabled', true);
		var localityName = $("#localityName_create").val();
		var state = $("#selectedState_create").val();

		if (!isEmpty(localityName) && !isEmpty(state) && state != '-1') {
			var data = {
				"selectedState" : state,
				"localityName" : localityName
			};

			$.ajax({
				url : "locality_processCreateLocality.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#localityTable").DataTable().destroy();
					loadLocalityTable();
					$("#model-close-btn").click();
					hideTables();

					/* $('#selectedState_create option').prop('selected', function() {
						return this.defaultSelected;
					}); */

					reloadLocalityDropDown();
					$(obj).prop('disabled', false);
				}
			});
		} else if (isEmpty(localityName)) {
			alert("Locality Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(state) || state == '-1') {
			alert("State is empty");
			$(obj).prop('disabled', false);
		}

	}

	function openLocalityEditWindow(id, obj) {
		hideTables();
		var existingLocalityName = $(obj).closest('td').prev('td').prev('td')
				.prev('td').text();

		$("#localityId").val(id);
		$("#localityName_update").val(existingLocalityName);

		$('#selectedState_update option').prop('selected', function() {
			return this.defaultSelected;
		});

		$("#localityUpdateTable").show();
		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processUpdateLocality(obj) {
		$(obj).prop('disabled', true);
		var localityName = $("#localityName_update").val();
		var state = $("#selectedState_update").val();

		if (!isEmpty(localityName) && !isEmpty(state) && state != '-1') {
			var data = {
				"id" : $("#localityId").val(),
				"selectedState" : state,
				"localityName" : localityName
			};

			$.ajax({
				url : "locality_processUpdateLocality.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#localityTable").DataTable().destroy();
					loadLocalityTable();
					$("#model-close-btn").click();
					hideTables();

					/* $('#selectedState_create option').prop('selected', function() {
						return this.defaultSelected;
					}); */

					reloadLocalityDropDown();
					$(obj).prop('disabled', false);

				}
			});
		} else if (isEmpty(localityName)) {
			alert("Locality Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(state) || state == '-1') {
			alert("State is empty");
			$(obj).prop('disabled', false);
		}

	}

	/* locality related functionalities end */

	/* City related functionalities start */

	function openCityCreateWindow() {
		hideTables();
		$("#cityCreateTable").show();

		$("#cityName_create").val("");

		$('#selectedLocality_create option').prop('selected', function() {
			return this.defaultSelected;
		});

		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processCreateCity(obj) {
		$(obj).prop('disabled', true);
		var cityName = $("#cityName_create").val();
		var locality = $("#selectedLocality_create").val();

		if (!isEmpty(cityName) && !isEmpty(locality) && locality != '-1') {
			var data = {
				"selectedDistrict" : locality,
				"cityName" : cityName
			};

			$.ajax({
				url : "municipality_processCreateCity.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#cityTable").DataTable().destroy();
					loadCityTable();
					$("#model-close-btn").click();
					hideTables();

					/* $('#selectedLocality_create option').prop('selected', function() {
						return this.defaultSelected;
					}); */

					reloadCityDropDown();
					$(obj).prop('disabled', false);
				}
			});
		} else if (isEmpty(cityName)) {
			alert("City Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(locality) || locality == '-1') {
			alert("Locality is empty");
			$(obj).prop('disabled', false);
		}

	}

	function openCityEditWindow(id, obj) {
		hideTables();
		var existingCityName = $(obj).closest('td').prev('td').prev('td').prev(
				'td').prev('td').text();

		$("#cityId").val(id);
		$("#cityName_update").val(existingCityName);

		$('#selectedLocality_update option').prop('selected', function() {
			return this.defaultSelected;
		});

		$("#cityUpdateTable").show();
		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processUpdateCity(obj) {
		$(obj).prop('disabled', true);
		var cityName = $("#cityName_update").val();
		var locality = $("#selectedLocality_update").val();

		if (!isEmpty(cityName) && !isEmpty(locality) && locality != '-1') {
			var data = {
				"id" : $("#cityId").val(),
				"selectedDistrict" : locality,
				"cityName" : cityName
			};

			$.ajax({
				url : "municipality_processUpdateCity.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#cityTable").DataTable().destroy();
					loadCityTable();
					$("#model-close-btn").click();
					hideTables();

					/* $('#selectedLocality_update option').prop('selected', function() {
						return this.defaultSelected;
					}); */

					reloadCityDropDown();
					$(obj).prop('disabled', false);

				}
			});
		} else if (isEmpty(cityName)) {
			alert("City Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(locality) || locality == '-1') {
			alert("Locality is empty");
			$(obj).prop('disabled', false);
		}

	}

	/* City related functionalities end */

	/* Village related functionalities start  */

	function openVillageCreateWindow() {
		hideTables();
		$("#villageCreateTable").show();

		$("#villageName_create").val("");

		$('#selectedCity_create option').prop('selected', function() {
			return this.defaultSelected;
		});

		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processCreateVillage(obj) {
		$(obj).prop('disabled', true);
		var villageName = $("#villageName_create").val();
		var city = $("#selectedCity_create").val();

		if (!isEmpty(villageName) && !isEmpty(city) && city != '-1') {
			var data = {
				"selectedCity" : city,
				"villageName" : villageName
			};

			$.ajax({
				url : "village_processCreateVillage.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#villageTable").DataTable().destroy();
					loadVillageTable();
					$("#model-close-btn").click();
					hideTables();

					$('#selectedCity_create option').prop('selected',
							function() {
								return this.defaultSelected;
							});
					$(obj).prop('disabled', false);

				}
			});
		} else if (isEmpty(villageName)) {
			alert("Village Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(city) || city == '-1') {
			alert("City is empty");
			$(obj).prop('disabled', false);
		}

	}

	function openVillageEditWindow(id, obj) {
		hideTables();
		var existingVillageName = $(obj).closest('td').prev('td').prev('td')
				.prev('td').prev('td').prev('td').text();

		$("#villageId").val(id);
		$("#villageName_update").val(existingVillageName);

		$('#selectedCity_update option').prop('selected', function() {
			return this.defaultSelected;
		});

		$("#villageUpdateTable").show();
		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}

	function processUpdateVillage(obj) {
		$(obj).prop('disabled', true);
		var villageName = $("#villageName_update").val();
		var city = $("#selectedCity_update").val();

		if (!isEmpty(villageName) && !isEmpty(city) && city != '-1') {
			var data = {
				"id" : $("#villageId").val(),
				"selectedCity" : city,
				"villageName" : villageName
			};

			$.ajax({
				url : "village_processUpdateVillage.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#villageTable").DataTable().destroy();
					loadVillageTable();
					$("#model-close-btn").click();
					hideTables();

					$('#selectedCity_update option').prop('selected',
							function() {
								return this.defaultSelected;
							});
					$(obj).prop('disabled', false);

				}
			});
		} else if (isEmpty(villageName)) {
			alert("Village Name is empty");
			$(obj).prop('disabled', false);
		} else if (isEmpty(city) || city == '-1') {
			alert("City is empty");
			$(obj).prop('disabled', false);
		}

	}

	/* Village related functionalities end */

	/* refresh dropdown functions start */

	function reloadCountryDropDown() {

		$
				.ajax({
					url : "village_refreshCountriesList.action",
					async : false,
					type : 'post',
					success : function(result) {
						var obj = JSON.parse(result);

						var country_create = $('#selectedCountry_create');
						country_create.find('option').remove();
						$('<option>').val("-1").text("Select").appendTo(
								country_create);

						var country_update = $('#selectedCountry_update');
						country_update.find('option').remove();
						$('<option>').val("-1").text("Select").appendTo(
								country_update);

						for ( var key in obj) {
							if (obj.hasOwnProperty(key)) {
								var val = obj[key];
								//console.log(key +" - "+val);
								$('<option>').val(key).text(val).appendTo(
										country_create);
								$('<option>').val(key).text(val).appendTo(
										country_update);
							}
						}

					}
				});

	}

	function reloadStateDropDown() {

		$
				.ajax({
					url : "village_refreshStateList.action",
					async : false,
					type : 'post',
					success : function(result) {
						var obj = JSON.parse(result);

						var state_create = $('#selectedState_create');
						state_create.find('option').remove();
						$('<option>').val("-1").text("Select").appendTo(
								state_create);

						var state_update = $('#selectedState_update');
						state_update.find('option').remove();
						$('<option>').val("-1").text("Select").appendTo(
								state_update);

						for ( var key in obj) {
							if (obj.hasOwnProperty(key)) {
								var val = obj[key];
								//console.log(key +" - "+val);
								$('<option>').val(key).text(val).appendTo(
										state_create);
								$('<option>').val(key).text(val).appendTo(
										state_update);
							}
						}

					}
				});

	}

	function reloadLocalityDropDown() {

		$.ajax({
			url : "village_refreshLocalityList.action",
			async : false,
			type : 'post',
			success : function(result) {
				var obj = JSON.parse(result);

				var locality_create = $('#selectedLocality_create');
				locality_create.find('option').remove();
				$('<option>').val("-1").text("Select")
						.appendTo(locality_create);

				var locality_update = $('#selectedLocality_update');
				locality_update.find('option').remove();
				$('<option>').val("-1").text("Select")
						.appendTo(locality_update);

				for ( var key in obj) {
					if (obj.hasOwnProperty(key)) {
						var val = obj[key];
						//console.log(key +" - "+val);
						$('<option>').val(key).text(val).appendTo(
								locality_create);
						$('<option>').val(key).text(val).appendTo(
								locality_update);
					}
				}

			}
		});

	}

	function reloadCityDropDown() {

		$.ajax({
			url : "village_refreshCityList.action",
			async : false,
			type : 'post',
			success : function(result) {
				var obj = JSON.parse(result);

				var city_create = $('#selectedCity_create');
				city_create.find('option').remove();
				$('<option>').val("-1").text("Select").appendTo(city_create);

				var city_update = $('#selectedCity_update');
				city_update.find('option').remove();
				$('<option>').val("-1").text("Select").appendTo(city_update);

				for ( var key in obj) {
					if (obj.hasOwnProperty(key)) {
						var val = obj[key];
						//console.log(key +" - "+val);
						$('<option>').val(key).text(val).appendTo(city_create);
						$('<option>').val(key).text(val).appendTo(city_update);
					}
				}

			}
		});

	}

	/* refresh dropdown functions end */
</script>

<body>

	<!-- Nav tabs -->
	<ul class="nav nav-pills nav-justified" role="tablist">
		<li class="nav-item waves-effect waves-light" style="padding: 10px"><a
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
		<li class="nav-item waves-effect waves-light" style="padding: 10px"><a
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
		<li class="nav-item waves-effect waves-light" style="padding: 10px"><a
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

		<li class="nav-item waves-effect waves-light" style="padding: 10px"><a
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

		<li class="nav-item waves-effect waves-light" style="padding: 10px"><a
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
			<div>

				<sec:authorize ifAllGranted="profile.procurementProduct.create">
					<button type="BUTTON" id="add" data-toggle='modal'
						data-target='#slide' onclick='openCountryCreateWindow();'
						class="btn btn-success mb-2 float-right">
						Add Country <i class="ri-menu-add-line align-middle ml-2"></i>
					</button>
				</sec:authorize>

			</div>
			<br> <br>
			<div class="row">
				<div class="col-12">
					<table id="countryTable"
						class="table table-bordered dt-responsive nowrap"
						style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
				</div>
			</div>

		</div>

		<div class="tab-pane" id="state-tabs" role="tabpanel">
			<div>
				<sec:authorize ifAllGranted="profile.procurementProduct.create">
					<button type="BUTTON" id="add" data-toggle='modal'
						data-target='#slide' onclick='openStateCreateWindow();'
						class="btn btn-success mb-2 float-right">
						Add State <i class="ri-menu-add-line align-middle ml-2"></i>
					</button>
				</sec:authorize>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-12">
					<table id="stateTable" class="display" width="100%"></table>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="locality-tabs" role="tabpanel">
			<div>
				<sec:authorize ifAllGranted="profile.procurementProduct.create">
					<button type="BUTTON" id="add" data-toggle='modal'
						data-target='#slide' onclick='openLocalityCreateWindow();'
						class="btn btn-success mb-2 float-right">
						Add Locality <i class="ri-menu-add-line align-middle ml-2"></i>
					</button>
				</sec:authorize>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-12">
					<table id="localityTable" class="display" width="100%"></table>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="city-tabs" role="tabpanel">
			<div>
				<sec:authorize ifAllGranted="profile.procurementProduct.create">
					<button type="BUTTON" id="add" data-toggle='modal'
						data-target='#slide' onclick='openCityCreateWindow();'
						class="btn btn-success mb-2 float-right">
						Add City <i class="ri-menu-add-line align-middle ml-2"></i>
					</button>
				</sec:authorize>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-12">
					<table id="cityTable" class="display" width="100%"></table>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="village-tabs" role="tabpanel">
			<div>
				<sec:authorize ifAllGranted="profile.procurementProduct.create">
					<button type="BUTTON" id="add" data-toggle='modal'
						data-target='#slide' onclick='openVillageCreateWindow();'
						class="btn btn-success mb-2 float-right">
						Add Village <i class="ri-menu-add-line align-middle ml-2"></i>
					</button>
				</sec:authorize>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-12">
					<table id="villageTable" class="display" width="100%"></table>
				</div>
			</div>
		</div>

	</div>

	<div id="slide" class="modal fade bs-example-modal-center"
		role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="cropSlideHead" class="modal-title mt-0">Add Crop
						Information</h5>
					<button type="button" class="close" id="model-close-btn"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

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
									onclick="processCreateCountry(this);">
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
									onclick="processUpdateCountry(this);">
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

					<!-- State create table start -->

					<table id="stateCreateTable"
						class="table table-bordered aspect-detail">

						<tr class="odd">
							<td><s:text name="State Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="stateName_create" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="Country" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedCountry_create" list="countryList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>

						</tr>


						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processCreateState(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- State create table end -->

					<!-- State update table start -->

					<table id="stateUpdateTable"
						class="table table-bordered aspect-detail">

						<s:hidden id="stateId" />

						<tr class="odd">
							<td><s:text name="State Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="stateName_update" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="Country" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedCountry_update" list="countryList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>

						</tr>


						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processUpdateState(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- State update table end -->

					<!-- Locality create table start -->

					<table id="localityCreateTable"
						class="table table-bordered aspect-detail">

						<tr class="odd">
							<td><s:text name="Locality Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="localityName_create" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="State" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedState_create" list="stateList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>
						</tr>

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processCreateLocality(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- Locality create table end -->

					<!-- Locality update table start -->

					<table id="localityUpdateTable"
						class="table table-bordered aspect-detail">

						<s:hidden id="localityId" />

						<tr class="odd">
							<td><s:text name="Locality Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="localityName_update" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="State" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedState_update" list="stateList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>
						</tr>

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processUpdateLocality(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- Locality update table end -->

					<!-- City create table start -->

					<table id="cityCreateTable"
						class="table table-bordered aspect-detail">

						<tr class="odd">
							<td><s:text name="City Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="cityName_create" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="Locality" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedLocality_create" list="localityList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>
						</tr>

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processCreateCity(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- City create table end -->


					<!-- City update table start -->

					<table id="cityUpdateTable"
						class="table table-bordered aspect-detail">

						<s:hidden id="cityId" />

						<tr class="odd">
							<td><s:text name="City Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="cityName_update" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="Locality" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedLocality_update" list="localityList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>
						</tr>

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processUpdateCity(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- City update table end -->


					<!--  -->
					<!--  -->

					<!-- Village create table start -->

					<table id="villageCreateTable"
						class="table table-bordered aspect-detail">

						<tr class="odd">
							<td><s:text name="Village Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="villageName_create" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="City" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedCity_create" list="cityList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>
						</tr>

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processCreateVillage(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- Village create table end -->


					<!-- Village update table start -->

					<table id="villageUpdateTable"
						class="table table-bordered aspect-detail">

						<s:hidden id="villageId" />

						<tr class="odd">
							<td><s:text name="Village Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="villageName_update" maxlength="20"
									cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td><s:text name="City" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control "
									id="selectedCity_update" list="cityList" headerKey="-1"
									headerValue="%{getText('txt.select')}" /></td>
						</tr>

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processUpdateVillage(this);">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>

					<!-- Village update table end -->

				</div>
			</div>
		</div>
	</div>






</body>
</html>