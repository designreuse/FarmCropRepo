<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">
</head>
<body>
	<script type="text/javascript">
$(document).ready(function(){	
	
	loadUserTable();
	
    
});


function loadUserTable(){
	$.ajax({
		url : "user_populateUserGridData.action",
		async : false,
		type : 'post',
		success : function(result) {

			var data = JSON.parse(result);
			$('#userGrid').DataTable({
				"data" : data,
				"order" : [],
				"columns" : [ {
					title : "User Name"
				}, {
					title : "First Name"
				}, {
					title : "Last Name"
				}, {
					title : "Mobile Number"
				}, {
					title : "Role"
				}, {
					title : "Status"
				}, {
					title : "Action"
				} ]
			});

		}
	});
}

function redirectUserDetailPage(id, obj) {
	document.updateform.id.value  =id;
    document.updateform.submit(); 
}
</script>

	<div>
	<sec:authorize ifAllGranted="profile.user.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()" class="btn btn-success mb-2 float-right" >Add User <i class="ri-menu-add-line align-middle ml-2"></i></button>
			</sec:authorize>
	</div>
	
	<br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="userGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>


	<s:form name="createform" action="user_create">
	</s:form>
	<s:form name="updateform" action="user_detail">
		<s:hidden key="id" />
		<s:hidden key="currentPage" />
	</s:form>
</body>