<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
	<META name="decorator" content="swithlayout">
</head>
<script type="text/javascript">
	$(document).ready(function(){
		loadSamithiTable();
		var tenant='<s:property value="getCurrentTenantId()"/>';
		$(".breadcrumb ol").children('li').eq(1).empty();
		//alert('<s:property value="getBranchId()"/>');
		if('<s:property value="getCurrentTenantId()"/>' == 'pratibha' && '<s:property value="getBranchId()"/>' == 'bci'){
			//alert($(".breadcrumb ol").children('li').eq(1));
			$(".breadcrumb").find('li:not(:first)').remove();
			
			
		$(".breadcrumb").append('<li><a href="samithi_list.action">  /  <s:property value="%{getLocaleProperty('profile.samithi.bci')}" /></a></li>');
		}
	
		
	}); 
	
	function getBranchIdDyn(){
		return null;
	}
	
	function loadSamithiTable(){
		$.ajax({
			url : "samithi_populateSamithiTableData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#samithiGrid').DataTable({
					"data" : data,
					"order" : [],
					"columns" : [ {
						title : "Code"
					}, {
						title : "Group"
					}, {
						title : "Action"
					} ]
				});

			}
		});
	}
	
	function redirectSamithiDetailPage(id, obj) {
		 document.updateform.id.value  =id;
	      document.updateform.submit();    
	}
	
</script>
<div>
<sec:authorize access="hasAnyRole('profile.samithi.create','profile.samithi.bci.create')">
	<button type="BUTTON" id="add" class="btn btn-success mb-2 float-right"  onclick="document.createform.submit()" ><s:property value="%{getLocaleProperty('Add Group')}" /><i class="ri-menu-add-line align-middle ml-2"></i> </button>
</sec:authorize>

</div>
<br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="samithiGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>
<!-- <div>
	 <div class="table-responsive mt-3"  id="baseDiv">
			<table class="table table-centered datatable dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;" id="detail"></table>
			<div id="jqGridPager"></div>
		</div> 
	</div> -->

<s:form name="createform" action="samithi_create">
</s:form>
<s:form name="updateform" action="samithi_detail">
	<s:hidden key="id" />
	<s:hidden key="currentPage"/>
</s:form>