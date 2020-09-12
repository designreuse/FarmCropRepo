<%@ include file="/jsp/common/form-assets.jsp"%>
<%@ include file="/jsp/common/grid-assets.jsp"%>
<%@ include file="/jsp/common/detail-assets.jsp"%>
<head>



<!-- add this meta information to select layout  -->
<META name="decorator" content="swithlayout">
</head>
<s:head />

	<s:form name="roleform" cssClass="fillform">
		<s:hidden key="id" id="id" />


		<!-- new design start -->
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
										<s:text name="info.roleMenu" />
									</h3>
									<div class="wizard-desc">Setup Role Menu Details</div>
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
					<div class="col-md-4">
						<div class="form-group ">
							<label for="txt"><s:text name="Role" /><sup
								style="color: red;">*</sup> </label>

							<div class="">
								<s:select name="selectedRole" list="roles" listKey="id"
									id="selectedRole" listValue="name" theme="simple"
									
									cssClass="form-control input-sm "
									onchange="loadMenusMultiSelectDropDown();" />
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group ">
							<label for="txt"> <s:text name="parentMenu" /><sup
								style="color: red;">*</sup>
							</label>
							<div class="">
								<s:select name="selectedParentMenu" list="parentMenus"
									id="parentMenu" theme="simple"
									onchange="listview();loadMenusMultiSelectDropDown();"
									cssClass="form-control input-sm " />
							</div>
						</div>
					</div>
					</div>
					<div class="row">

					<div class="col-md-12">
						<div class="form-group ">
							<label for="txt"> <s:text name="Choose Menus" /><sup
								style="color: red;">*</sup>
							</label>
							<div class="">
								<s:select name="selected" id="menus" list="allSubMenu"
									listKey="id" listValue="name" headerKey="headerKey"
									multiple="true"
									cssClass="select2 form-control select2-multiple" tabindex="10" />
							</div>
						</div>
					</div>



				</div>


			</div>
		</div>
		</div>

			
							<div class="button-items float-right">

			
				<button type="button" id="buttonAdd1"
					
					class="btn btn-success waves-effect waves-light">
					<i class="ri-check-line align-middle mr-2"></i> Save
				</button>
		
			<button type="button" onclick="onCancel();"
				class="btn btn-danger waves-effect waves-light">
				<i class="ri-close-line align-middle mr-2"></i> Cancel
			</button>
		</div>
			

	</s:form>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#dynOpt")
								.find(
										"input[type='button'][value='<s:text name="RemoveAll"/>']")
								.addClass("btn btn-warning");

						$("#dynOpt")
								.find(
										"input[type='button'][value='<s:text name="Add"/>']")
								.addClass(
										"btn btn-small btn-success fa fa-step-forward");
						$("#dynOpt")
								.find(
										"input[type='button'][value='<s:text name="Remove"/>']")
								.addClass("btn btn-danger");
						$("#dynOpt")
								.find(
										"input[type='button'][value='<s:text name="AddAll"/>']")
								.addClass("btn btn-sts");
						loadMenusMultiSelectDropDown();
					});

	function loadMenusMultiSelectDropDown() {
		var selectedRole = $("#selectedRole").val();
		var parentMenu = $("#parentMenu").val();

		if (!isEmpty(selectedRole) && !isEmpty(parentMenu)
				&& selectedRole != '-1' && parentMenu != '-1') {

			var data = {
				"selectedRoleId" : selectedRole,
				"selectedParentMenuId" : parentMenu
			};

			$.ajax({
				url : "roleMenu_populateAvailableSubMenusByRole.action",
				async : false,
				type : 'post',
				data : data,
				success : function(result) {

					var data = JSON.parse(result);
					$("#menus").val(data.existingMenuIds).change();

				}
			});

		}

	}

	function listview() {
		document.roleform.action = "roleMenu_update.action";
		document.getElementById("id").value = "";
		document.roleform.submit();
	}

	$(document).ready(function() {
		$('button').on('click', function(e) {
			
			document.roleform.action = "roleMenu_update.action";
			document.getElementById("id").value = "1";
			document.roleform.submit();
		});
	});
	
	function onCancel(){
		
			window.location.href="roleMenu_list.action";
	
	}
</script>
