<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ese-tags" prefix="e"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">

</head>
<div id='warn' class="error">
	<s:actionerror />
</div>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						loadRoleTable();
						
						
					});
	
	function loadRoleTable(){
		$.ajax({
			url : "role_populateRoleGridData.action",
			async : false,
			type : 'post',
			success : function(result) {

				var data = JSON.parse(result);
				$('#roleGrid').DataTable({
					"data" : data,
					"order" : [],
					"columns" : [ {
						title : "Role Name"
					}, {
						title : "Action"
					} ]
				});

			}
		});
	}
	
	function redirectRoleDetailPage(id, obj) {
		document.updateform.id.value = id;
		document.updateform.submit();
	}
</script>
<div>
	<sec:authorize ifAllGranted="profile.role.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()" class="btn btn-success mb-2 float-right" >Add Role <i class="ri-menu-add-line align-middle ml-2"></i></button>
			</sec:authorize>
</div>
<br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="roleGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>




<s:form name="createform" action="role_create">
</s:form>

<s:form name="updateform" action="role_detail">
	<s:hidden key="id" />
</s:form>


