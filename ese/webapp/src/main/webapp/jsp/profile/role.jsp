<%@ include file="/jsp/common/form-assets.jsp"%>
<head>
<!-- add this meta information to select layout  -->
<META name="decorator" content="swithlayout">
</head>
<%@ include file="/jsp/common/grid-assets.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('button').on('click', function(e) {
			<s:if test="command =='create'">
			document.roleform.action = "role_create.action";
			</s:if>
			<s:else>
			document.roleform.action = "role_update.action";
			</s:else>
			document.roleform.submit();
		});
	});

	function populateSubBranch(obj) {
		var branchId = $(obj).val();
		jQuery.post("user_populateSubBranches.action", {
			branchId_F : branchId
		}, function(result) {
			insertOptions("subBranchSelect", $.parseJSON(result));
		});

	}

	function populateRoleMulti(obj) {
		var branchId = $(obj).val();
		if (isEmpty(branchId)) {
			branchId = $("#branchSelect").val();
		}
		reloadSelect('#selectRole', 'user_populateRoles.action?branchId_F='
				+ branchId);
	}
	function onCancel(){
		location.href="role_list.action";
	
	}
	
</script>

	<s:form name="roleform" action="role" cssClass="fillform">
		<s:hidden key="id" />
		<s:if test='"update".equalsIgnoreCase(command)'>
			<s:hidden key="role.id" />
		</s:if>
		<s:hidden key="command" />
		<s:hidden name="role.filter.id" value="1" />
		
	<div class="ferror" id="errorDiv" class=" hide alert alert-danger">
			<s:actionerror theme="bootstrap" />
			<s:fielderror theme="bootstrap" />
		</div>

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
											<s:text name="info.role" />
										</h3>
										<div class="wizard-desc">Setup Role Information Details</div>
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
							<div class="form-group roleName">
								<label for="txt"><s:text name="roleName" /><sup
									style="color: red;">*</sup> </label>

								<div class="">
									<s:textfield size="23" maxlength="45" name="role.name"
										cssClass="form-control input-sm" />
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group isAdmin">
								<label for="txt"> <s:text name="isAdmin" />
								</label>
								<div class="">
									
									<s:select headerKey="-1" headerValue="%{getText('txt.select')}"
										list="#{'true':'Yes', 'false':'No'}" name="role.isAdminUser"
										cssClass="form-control " />
								</div>
							</div>
						</div>



					</div>


				</div>
			</div>
</div>

	

		<div class="button-items float-right">
		
		
			<s:if test="command =='create'">
				<button type="button" id="buttonAdd1"
					
					class="btn btn-success waves-effect waves-light">
					<i class="ri-check-line align-middle mr-2"></i> Save
				</button>
			</s:if>
			<s:else>
				<button type="submit" id="buttonUpdate"
					
					class="btn btn-primary waves-effect waves-light">
					<i class="ri-error-warning-line align-middle mr-2"></i> Update
				</button>
			</s:else>
			<button type="button" onclick="onCancel();"
				class="btn btn-danger waves-effect waves-light">
				<i class="ri-close-line align-middle mr-2"></i> Cancel
			</button>

				</div>



	</s:form>





<script type="text/javascript">
	$(document).ready(function() {
		$('#update').on('click', function(e) {
			document.roleform.action = "role_update.action";

			document.roleform.submit();
		});

	});
	
	function onCancel(){
		location.href="role_list.action";
	
	}
</script>