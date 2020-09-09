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
</script>

<div id="rolcr">
	<s:form name="roleform" action="role" cssClass="fillform">
		<s:hidden key="id" />
		<s:if test='"update".equalsIgnoreCase(command)'>
			<s:hidden key="role.id" />
		</s:if>
		<s:hidden key="command" />
		<s:hidden name="role.filter.id" value="1" />
		<div class="appContentWrapper marginBottom">
			<div class="error">
				<s:actionerror />
				<s:fielderror />


				<%-- <sup>*</sup>
				<s:text name="reqd.field" /> --%>
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
										<div class="wizard-desc">Role details</div>
									</div>
								</div>
								<i
									class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
							</h6>
						</div>
					</a>

				</div>
				<div class="card-body">


					<div class="row">
						<div class="col-md-4">
							<div class="form-group farmerCode">
								<label for="txt"><s:text name="roleName" /><sup
									style="color: red;">*</sup> </label>

								<div class="">
									<s:textfield size="23" maxlength="45" name="role.name"
										theme="simple" cssClass="form-control input-sm" />
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group farmerCode">
								<label for="txt"> <s:text name="isAdmin" /><sup
									style="color: red;">*</sup>
								</label>
								<div class="">
									<%-- <s:checkbox name="role.isAdminUser" theme="simple" /> --%>


									<s:select headerKey="-1" headerValue="%{getText('txt.select')}"
										list="#{'true':'Yes', 'false':'No'}" name="role.isAdminUser"
										theme="simple" cssClass="col-md-6 form-control " />
								</div>
							</div>
						</div>



					</div>


				</div>
			</div>


			<div class="formContainerWrapper">
				<!-- <h2>
					<s:text name="info.role" />
				</h2> -->
				<div class="flexiWrapper">
					<s:if test='isMultiBranch==1'>


						<s:if test='branchId==null'>
							<!-- <s:if test='"create".equalsIgnoreCase(command)'>
									<s:label theme="simple">
										<s:text name="app.branch" />
									</s:label>
									<div class="form-element">
										<s:select name="branchId_F" id="branchSelect" theme="simple"
											listKey="key" listValue="value" list="parentBranches"
											headerKey="" headerValue="%{getText('txt.select')}"
											onchange="populateSubBranch(this)"
											cssClass="form-control input-sm select2" />
									</div>
								</s:if> -->
							<s:if test='"update".equalsIgnoreCase(command)'>
								<div class="flexi flexi10">
									<label for="txt"><s:text name="app.subBranch" /></label>
									<div class="form-element">
										<s:property value="%{getBranchName(role.parentBranchId)}" />
									</div>
								</div>
							</s:if>
						</s:if>




						<%-- <s:if test='isMultiBranch=="1"&&(getIsParentBranch()==1||branchId==null)'>
						<div class="flexi flexi10">
						<s:if test='"create".equalsIgnoreCase(command)'>
							<label for="txt"><s:text name="app.subBranch" /></label>
							<div class="form-element">
								<s:select name="subBranchId_F" id="subBranchSelect" theme="simple"
											listKey="key" listValue="value" list="subBranchesMap"
											headerKey="" headerValue="%{getText('txt.select')}"
											onchange="populateRoleMulti(this)"
											cssClass="form-control input-sm select2" />
							</div>
						</s:if>	
						  <s:if test='"update".equalsIgnoreCase(command)'>
								<div class="flexi flexi10">
									<label for="txt">	<s:text name="app.subBranch" /></label>
									<div class="form-element">
											<s:property value="%{getBranchName(role.branchId)}" /><s:hidden name="role.branchId" />
									</div>
								</div>
							</s:if>
						</div>
					</s:if> --%>
						<s:if
							test='isMultiBranch=="1"&&(getIsParentBranch()==1||branchId==null)'>
							<div class="flexi flexi10">
								<s:if test='"create".equalsIgnoreCase(command)'>
									<label for="txt"><s:text name="app.subBranch" /></label>
									<div class="form-element">
										<s:select name="subBranchId_F" id="subBranchSelect"
											theme="simple" listKey="key" listValue="value"
											list="subBranchesMap" headerKey=""
											headerValue="%{getText('txt.select')}"
											onchange="populateRoleMulti(this)"
											cssClass="form-control input-sm select2" />
									</div>
								</s:if>
								<s:if test='"update".equalsIgnoreCase(command)'>
									<div class="flexi flexi10">
										<label for="txt"> <s:text name="app.subBranch" /></label>
										<div class="form-element">
											<s:property value="%{getBranchName(role.branchId)}" />
											<s:hidden name="role.branchId" />
										</div>
									</div>
								</s:if>
							</div>
						</s:if>

					</s:if>
					<s:else>
						<s:if test='branchId==null'>
							<!-- <s:if test='"create".equalsIgnoreCase(command)'>
						
							<div class="flexi flexi10">
									<label for="txt"><s:text name="app.branch" /><sup> *</sup></label>
									<div class="form-element">
										<s:select name="branchId_F" theme="simple" listKey="key"
										listValue="value" list="branchesMap" headerKey="-1"
										headerValue="%{getText('txt.select')}"
										cssClass="form-control input-sm select2" />
									</div>
								</div>
						</s:if> -->
							<s:if test='"update".equalsIgnoreCase(command)'>
								<s:hidden name="branchId_F" value="%{role.branchId}" />
								<!-- <div class="flexi flexi10">
									<label for="txt">	<s:text name="app.branch" /></label>
									<div class="form-element">
										<s:property value="%{getBranchName(role.branchId)}" />
									</div>
								</div>  -->
							</s:if>
						</s:if>

					</s:else>
					<div class="flexi flexi10">
						<!--	<label for="txt"><s:text name="roleName" /><sup> *</sup></label>
									  <div class="form-element"><s:textfield size="23" maxlength="45" name="role.name"
							theme="simple" cssClass="form-control input-sm" />
										</div>  -->
					</div>

					<div class="flexi flexi10">
						<!--  <label for="txt"><s:text name="isAdmin" /></label>
										 <div class="form-element"><s:checkbox name="role.isAdminUser" theme="simple" />
										</div> -->
					</div>
				</div>

				<div>
					<s:if test="command =='create'">
						<span id="button" class=""><span class="first-child">
								<button type="button" class="save-btn btn btn-success">
									<FONT color="#FFFFFF"> <b><s:text name="save.button" /></b>
									</FONT>
								</button>
						</span></span>
						<span class=""><span class="first-child"><a
								id="cancel.link" href="role_list.action"
								class="cancel-btn btn btn-sts"> <FONT color="#FFFFFF">
										<s:text name="cancel.button" />
								</FONT>
							</a></span></span>
					</s:if>
					<s:else>
						<span id="button" class=""><span class="first-child">
								<button type="button" class="save-btn btn btn-success">
									<FONT color="#FFFFFF"> <b><s:text
												name="update.button" /></b>
									</FONT>
								</button>
						</span></span>
						<span class=""><span class="first-child"><a
								id="cancel.link" href="role_list.action"
								class="cancel-btn btn btn-sts"> <FONT color="#FFFFFF">
										<s:text name="cancel.button" />
								</FONT>
							</a></span></span>
					</s:else>
				</div>


			</div>
		</div>
	</s:form>
</div>





<script type="text/javascript">
	$(document).ready(function() {
		$('#update').on('click', function(e) {
			document.roleform.action = "role_update.action";

			document.roleform.submit();
		});

	});
</script>