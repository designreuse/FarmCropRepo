<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">

</head>


<script type="text/javascript">
$(document).ready(function(){

	loadSeasonTable();
	
	
    postdata =  ''; 
});

datePick = function(elem)
{	
   jQuery(elem).datepicker({
		   changeYear: true,
	       changeMonth: true,       
	       dateFormat: 'dd-mm-yy',
		   onSelect:function(dateText, inst){	   	 
		   		jQuery("#detail")[0].triggerToolbar();
		   }
	   }
)};


function loadSeasonTable(){
	$.ajax({
		url : "harvestSeason_populateSeasonTableData.action",
		async : false,
		type : 'post',
		success : function(result) {

			var data = JSON.parse(result);
			$('#seasonGrid').DataTable({
				"data" : data,
				"order" : [],
				"columns" : [ {
					title : "Code"
				}, {
					title : "Name"
				}, {
					title : "From Period"
				}, {
					title : "To Period"
				}, {
					title : "Action"
				}]
			});

		}
	});
}


function redirectSeasonDetailPage(id,obj){
	document.updateform.id.value  = id;
	document.updateform.submit();  
}

</script>

	<div>
		
			<sec:authorize ifAllGranted="profile.season.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()" class="btn btn-success mb-2 float-right" >Add Season <i class="ri-menu-add-line align-middle ml-2"></i></button>
			</sec:authorize>

</div>


<br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="seasonGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>

<!-- <div>
	 <div class="table-responsive mt-3"  id="baseDiv">
			<table class="table table-centered datatable dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;" id="detail"></table>
			<div id="pagerForDetail"></div>
		</div> 
	</div> -->
<s:form name="createform" action="harvestSeason_create">
</s:form>

<s:form name="updateform" action="harvestSeason_detail">
	<s:hidden key="id" />
	<s:hidden key="currentPage"/>
	<s:hidden name="postdata" id="postdata" />
</s:form>

