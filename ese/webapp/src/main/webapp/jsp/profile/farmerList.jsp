<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">

</head>
<body>

	<script type="text/javascript">
var recordLimit='<s:property value="exportLimit"/>';
//var filterda='';
$(document).ready(function(){	
	var tenant='<s:property value="getCurrentTenantId()"/>';
	var userName='<s:property value="getUsername()"/>';
	//populateMethod();
	
	var type= '<%=request.getParameter("type")%>';
							if (type == '2') {
								$(".breadCrumbNavigation").html('');
								$(".breadCrumbNavigation").append(
										"<li><a href='#'>Profile</a></li>");
								//$(".breadCrumbNavigation").append("<li><a href='#'>IRP</a></li>");
								$(".breadCrumbNavigation")
										.append(
												"<li><a href='farmer_list.action?type=2'>IRP</a></li>");
								$(".type").val(type);
							}

							postdata = '';
							loadFarmerTable();

						});
		function exportKML() {
			var count = jQuery("#detail").jqGrid('getGridParam', 'records');
			if (count > recordLimit) {
				alert('<s:text name="export.limited"/>');
			} else if (isDataAvailable("#detail")) {
				jQuery("#detail").setGridParam({
					postData : {
						rows : 0
					}
				});
				jQuery("#detail").jqGrid('excelExport', {
					url : 'farmer_populateKML.action'
				});
			} else {
				alert('<s:text name="export.nodata"/>');
			}

		}
		function exportXLS() {
			var count = jQuery("#detail").jqGrid('getGridParam', 'records');
			if (count > recordLimit) {
				alert('<s:text name="export.limited"/>');
			} else if (isDataAvailable("#detail")) {
				jQuery("#detail").setGridParam({
					postData : {
						rows : 0
					}
				});
				jQuery("#detail").jqGrid('excelExport', {
					url : 'farmer_populateXLS.action'
				});
			} else {
				alert('<s:text name="export.nodata"/>');
			}

		}

		function exportPDF() {
			var count = jQuery("#detail").jqGrid('getGridParam', 'records');
			if (count > recordLimit) {
				alert('<s:text name="export.limited"/>');
			} else if (isDataAvailable("#detail")) {
				jQuery("#detail").setGridParam({
					postData : {
						rows : 0
					}
				});
				jQuery("#detail").jqGrid('excelExport', {
					url : 'farmer_populatePDF.action'
				});
			} else {
				alert('<s:text name="export.nodata"/>');
			}
		}

		function populateQrCode() {

			var count = jQuery("#detail").jqGrid('getGridParam', 'records');

			if (isDataAvailable("#detail")) {
				jQuery("#detail").setGridParam({
					postData : {
						rows : 0
					}
				});
				jQuery("#detail").jqGrid('excelExport', {
					url : 'farmer_populateQrCode.action'
				});
			} else {
				alert('<s:text name="export.nodata"/>');
			}

		}
		function printQR(idd) {
			jQuery("#detail").setGridParam({
				postData : {
					rows : 0
				}
			});
			jQuery("#detail").jqGrid('excelExport', {
				url : "farmer_populateQRPdf.action?id=" + idd
			});

		}
		function populateMethod() {
			jQuery.post("farmer_populateMethod.action", {}, function(result) {
				var valuesArr = $.parseJSON(result);
				$.each(valuesArr, function(index, value) {

					jQuery('#farmerCount').text(value.farmerCount);
					jQuery('#farmerPercentage').text(
							value.farmerCountPercentage
									+ '<s:text name="last.month"/>');
					jQuery('#farmerStatus').addClass(value.farmerCountstauts);
					jQuery('#farmerPercentage').addClass(value.farmerText);

					jQuery('#farmCount').text(value.farmCount);
					jQuery('#farmPercentage').text(
							value.farmCountPercentage
									+ '<s:text name="last.month"/>');
					jQuery('#farmStatus').addClass(value.farmCountstauts);
					jQuery('#farmPercentage').addClass(value.farmText);

					jQuery('#farmCropCount').text(value.farmCropCount);
					jQuery('#farmCropPercentage').text(
							value.farmCropCountPercentage
									+ '<s:text name="last.month"/>');
					jQuery('#farmCropStatus').addClass(
							value.farmCropCountstauts);
					jQuery('#farmCropPercentage').addClass(value.farmCropText);

					jQuery('#cowCount').text(value.cowCount);
					jQuery('#cowPercentage').text(
							value.farmCropCountPercentage
									+ '<s:text name="last.month"/>');
					jQuery('#cowStatus').addClass(value.cowCountstauts);
					jQuery('#cowPercentage').addClass(value.cowText);

					jQuery('#farmLandCount').text(value.farmLandCount);
					jQuery('#farmLandPercentage').text(
							value.farmLandCountPercentage
									+ '<s:text name="last.month"/>');
					jQuery('#farmLandStatus').addClass(
							value.farmLandCountstauts);
					jQuery('#farmLandPercentage').addClass(value.farmLandText);

				});
			});
		}

		datePick = function(elem) {
			jQuery(elem).datepicker({
				changeYear : true,
				changeMonth : true,
				dateFormat : 'dd-mm-yy',
				onSelect : function(dateText, inst) {
					jQuery("#detail")[0].triggerToolbar();
				}
			})
		};

		function getBranchIdDyn() {
			return null;
		}

		function loadFarmerTable() {
			$.ajax({
				url : "farmer_populateFarmerTableData.action",
				async : false,
				type : 'post',
				success : function(result) {

					var data = JSON.parse(result);
					$('#farmerGrid').DataTable({
						"data" : data,
						"order" : [],
						"columns" : [ {
							title : "Farmer Code"
						}, {
							title : "Farmer Name"
						}, {
							title : "Father Name"
						}, {
							title : "Village"
						}, {
							title : "Group"
						}/* , {
											title : "Is Certified"
										} */, {
							title : "Status"
						}, {
							title : "Action"
						} ]
					});

				}
			});
		}

		function redirectFarmerDetailPage(id, obj) {
			document.updateform.id.value = id;
			document.updateform.submit();
		}
	</script>


	<div>

		<sec:authorize ifAllGranted="profile.farmer.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()"
				class="btn btn-success mb-2 float-right">
				Add Farmer <i class="ri-menu-add-line align-middle ml-2"></i>
			</button>
		</sec:authorize>

	</div>
	<br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="farmerGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>


	<s:form name="createform" action="farmer_create">
		<s:hidden name="type" class="type" />
	</s:form>
	<s:form name="updateform" action="farmer_detail">
		<s:hidden name="id" />
		<s:hidden name="postdata" id="postdata" />
		<s:hidden name="type" class="type" />
		<s:hidden name="currentPage" />
	</s:form>
	<s:form name="exportform">
	</s:form>


</body>
