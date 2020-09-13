<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">

</head>
<body>

	<script type="text/javascript">
		$(document).ready(function() {
			loadFarmerListReportGrid();
		});

		function loadFarmerListReportGrid() {
			$.ajax({
				url : "farmer_populateFarmerListReportGridData.action",
				async : false,
				type : 'post',
				success : function(result) {

					var data = JSON.parse(result);
					
					 var buttonCommon = {
						        exportOptions: {
						            format: {
						                body: function ( data, row, column, node ) {
						                    // Strip $ from salary column to make it numeric
						                    //return column === 5 ? data.replace( /[$,]/g, '' ) : data;
						                    return data;
						                }
						            }
						        }
						    };
					
					
					$('#farmerGrid').DataTable({
						"data" : data,
						"order" : [],
						"columns" : [ {
							title : "Farmer Code"
						}, {
							title : "Name of the Farmer"
						}, {
							title : "Gender"
						}, {
							title : "Age"
						}, {
							title : "Village"
						}, {
							title : "City"
						}, {
							title : "Locality"
						}, {
							title : "State"
						}, {
							title : "Country"
						}],
						dom: 'Bfrtip',
						buttons: [
				            $.extend( true, {}, buttonCommon, {
				                extend: 'copyHtml5'
				            } ),
				            $.extend( true, {}, buttonCommon, {
				                extend: 'excelHtml5'
				            } ),
				            $.extend( true, {}, buttonCommon, {
				                extend: 'pdfHtml5'
				            } )
				        ]
					});

				}
			});
		}
	</script>


	<div id="accordion" class="custom-accordion pers_info">
		<div class="card-header card mb-1 shadow-none">
			<a href="#persInfo" class="text-dark" data-toggle="collapse"
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
									<s:property value="%{getLocaleProperty('report.farmerList')}" />
								</h3>
								<div class="wizard-desc">Farmer Information Details</div>
							</div>
						</div>
						<i
							class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
					</h6>
				</div>
			</a>

		</div>
		<div id="persInfo" class="collapse show" aria-labelledby="headingOne"
			data-parent="#accordion">
			<div class="card-body">


				<div class="row">
					<div class="col-md-12">
						<table id="farmerGrid"
							class="table table-bordered dt-responsive nowrap"
							style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
					</div>
				</div>


			</div>
		</div>
	</div>

</body>
</html>