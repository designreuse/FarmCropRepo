<%@ include file="/jsp/common/grid-assets.jsp"%>

<head>
<META name="decorator" content="swithlayout">
</head>
<body>
	<script type="text/javascript">
var type="<%=request.getParameter("type")%>";
$(document).ready(function(){		
	
	loadMobileUserTable();
	
	
});	      


function loadMobileUserTable(){
	$.ajax({
		url : "fieldStaff_populateMobileUserTableData.action",
		async : false,
		type : 'post',
		success : function(result) {

			var data = JSON.parse(result);
			$('#mobileUserGrid').DataTable({
				"data" : data,
				"order" : [],
				"columns" : [ {
					title : "Id"
				}, {
					title : "First Name"
				}, {
					title : "Last Name"
				}, {
					title : "Mobile Number"
				}, {
					title : "Last Login"
				} , {
					title : "Version"
				} , {
					title : "Status"
				}, {
					title : "Action"
				} ]
			});

		}
	});
}

function redirectMobileUserDetailPage(id, obj) {
	document.updateform.id.value  =id;
    document.updateform.submit();
}
</script>

	<div>

		<sec:authorize ifAllGranted="profile.agent.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()"
				class="btn btn-success mb-2 float-right">
				Add Agent <i class="ri-menu-add-line align-middle ml-2"></i>
			</button>
		</sec:authorize>
	</div>
<br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="mobileUserGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>
	

	<s:form name="createform" action="%{type}_create?type=%{type}">
	</s:form>
	<s:form name="updateform" action="%{type}_detail?type=%{type}">
		<s:hidden name="id" />
		<s:hidden name="currentPage" />
	</s:form>
</body>
