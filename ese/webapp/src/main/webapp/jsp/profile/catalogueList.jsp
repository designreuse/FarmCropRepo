<head>
<META name="decorator" content="swithlayout">
</head>
<body>
	<%@ include file="/jsp/common/grid-assets.jsp"%>
	<%@ include file="/jsp/common/form-assets.jsp"%>
	<script type="text/javascript">
	var survey='';
	$(document).ready(function(){
		var tenant='<s:property value="getCurrentTenantId()"/>';
    	
    	
    	loadCatalogueValueTable();
    	hideTables();
		
	}); 
	
	function hideTables(){
		$("#CatalogueCreateTable").hide();
		$("#CatalogueUpdateTable").hide();
	}
	
	function openCatalogueCreateWindow(){
		hideTables();
		$("#catalogueName_create").val("");
		$('#catalogueTypez_create option').prop('selected', function() {
	        return this.defaultSelected;
	    });

		
		$("#CatalogueCreateTable").show();
		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}
	
	function processCreateCatalogueValue(){
		var data = {
				"catalogueName" : $("#catalogueName_create").val(),
				"typez" : $("#catalogueTypez_create").val()
			};

			$.ajax({
				url : "catalogue_processCreateCatalogueValue.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#catalogueValueTable").DataTable().destroy();
					loadCatalogueValueTable();
					$("#model-close-btn").click();
					hideTables();
					
					$('#catalogueTypez_create option').prop('selected', function() {
				        return this.defaultSelected;
				    });
				}
			});
	}
	
	function openCatalogueEditWindow(id,obj){
		hideTables();
		var existingCatalogueName = $(obj).closest('td').prev('td').prev('td').prev('td')
				.text();
		
		$("#catalogueId").val(id);
		$("#catalogueName_update").val(existingCatalogueName);
		
		$('#catalogueTypez_update option').prop('selected', function() {
	        return this.defaultSelected;
	    });
		
		$("#CatalogueUpdateTable").show();
		$('#slide').modal({
			show : true,
			closeOnEscape : true
		});
	}
	
	function processUpdateCatalogueValue(){
		var data = {
				"id" : $("#catalogueId").val(),
				"catalogueName" : $("#catalogueName_update").val(),
				"typez" : $("#catalogueTypez_update").val()
			};

			$.ajax({
				url : "catalogue_processUpdateCatalogueValue.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					$("#catalogueValueTable").DataTable().destroy();
					loadCatalogueValueTable();
					$("#model-close-btn").click();
					hideTables();
					
					$('#catalogueTypez_update option').prop('selected', function() {
				        return this.defaultSelected;
				    });
				}
			});
	}
	
 	
 	function loadCatalogueValueTable(){

		$
				.ajax({
					url : "catalogue_populateCatalogueValueList.action",
					async : false,
					type : 'post',
					success : function(result) {

						var data = JSON.parse(result);
						$('#catalogueValueTable').DataTable({
							"data" : data,
							"order": [],
							"columns" : [ {
								title : "Catalogue Code"
							}, {
								title : "Catalogue Name"
							}, {
								title : "Catalogue Type"
							}, {
								title : "Status"
							}, {
								title : "Action"
							} ]
						});

					}
				});
 	}
 	
</script>

<div>
<sec:authorize ifAllGranted="profile.procurementProduct.create">
				<button type="BUTTON" id="add" data-toggle='modal'
					data-target='#slide' onclick='openCatalogueCreateWindow();'
					class="btn btn-success mb-2 float-right">
					Add <i class="ri-menu-add-line align-middle ml-2"></i>
				</button>
			</sec:authorize>
			</div>
			<br><br>


	
	<div class="row">
                            <div class="col-12">
			
			<table id="catalogueValueTable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>

<div id="slide" class="modal fade bs-example-modal-center"
		role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="model-close-btn" class="close"
						data-dismiss="modal">&times;</button>
					<h4 id="slideHead"></h4>
				</div>

				<div class="modal-body">
					<!-- Catalogue Create table start -->
					
				
					
					<table id="CatalogueCreateTable"
						class="table table-bordered aspect-detail">
						
						<tr class="odd">
							<td><s:text name="Catalogue Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="catalogueName_create" 
									maxlength="20" cssClass="form-control" /></td>
						</tr>

						
						
						
						<tr class="odd">
							<td><s:text name="Typez" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control " id="catalogueTypez_create"
										 list="typezList" headerKey="-1"
										headerValue="%{getText('txt.select')}"
										 /></td>
							
						</tr>
						

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processCreateCatalogueValue();">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>
					
					
					<!-- Catalogue Create table end -->

					<!-- Catalogue Update table start -->
					
					
					<table id="CatalogueUpdateTable"
						class="table table-bordered aspect-detail">
						<s:hidden id="catalogueId" />
						<tr class="odd">
							<td><s:text name="Catalogue Name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="catalogueName_update" 
									maxlength="20" cssClass="form-control" /></td>
						</tr>

						
						
						
						<tr class="odd">
							<td><s:text name="Typez" /><sup style="color: red;">*</sup></td>
							<td><s:select cssClass="form-control " id="catalogueTypez_update"
										 list="typezList" headerKey="-1"
										headerValue="%{getText('txt.select')}"
										 /></td>
							
						</tr>
						

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="processUpdateCatalogueValue();">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning" id="cancel"
									data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>

					</table>
					
					<!-- Catalogue Update table end -->
				</div>
			</div>
		</div>
	</div>


</body>