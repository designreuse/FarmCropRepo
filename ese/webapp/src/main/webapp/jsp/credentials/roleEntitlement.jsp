<%@ include file="/jsp/common/form-assets.jsp"%>
<head>

<style type="text/css">
.alignTopLeft {
	float: left;
	width: 6em;
}
</style>
<!-- add this meta information to select layout  -->
<META name="decorator" content="swithlayout">
</head>
<s:form name="roleform">
	<s:hidden key="id" id="id" />
	<s:select name="selectedRole" list="roles" listKey="id"
		listValue="name" theme="simple" cssStyle="display:none" />

	
	
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
										<s:text name="info.roleMenuEnt" />
									</h3>
									<div class="wizard-desc">Role entitlement details</div>
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
							<label for="txt"><s:text name="Role" /><sup
								style="color: red;">*</sup> </label>

							<div class="">
								<s:property value="roleName" />
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group farmerCode">
							<label for="txt"> <s:text name="parentMenu" /><sup
								style="color: red;">*</sup>
							</label>
							<div class="">
								<s:select name="selectedParentMenu" list="parentMenus"
								theme="simple" onchange="listview()"
								cssClass="form-control input-sm select2" />
							</div>
						</div>
					</div>



				</div>


			</div>
		</div>
		<!-- new design end -->
	
		<div class="appContentWrapper marginBottom">

			<div class="formContainerWrapper">
				<%-- <h2>
					<s:text name="info.roleMenuEnt" />
				</h2> --%>

				<div class="flexiWrapper">
					<%-- <s:if test='branchId==null'>
						<div class="flexi flexi10">
							<label for="txt"><s:text name="app.branch" /></label>
							<div class="form-element">
								<s:property value="%{getBranchName(branchId_F)}" />
							</div>
						</div>
					</s:if> --%>

					<div class="flexi flexi10">
						<%-- <label for="txt"><s:text name="Role" /></label>
						<div class="form-element">
							<s:property value="roleName" />
						</div> --%>
					</div>
					<div class="flexi flexi10">
						<%-- <label for="txt"> <s:text name="parentMenu" /></label>
						<div class="form-element">
							<s:select name="selectedParentMenu" list="parentMenus"
								theme="simple" onchange="listview()"
								cssClass="form-control input-sm select2" /> --%>
						</div>
					</div>
				</div>
			</div>
			<div class="formContainerWrapper">
				<div class="panel panel-default">
					<table Class="fillform table table-bordered aspect-detail">
						<thead>
							<tr>
								<th colspan="<s:property value="actionMap.size()+1"/>">
									<div style="float: left">
										<s:text name="roleentitlements" />
									</div>
									<div style="float: right">
										<s:text name="select" />
										&nbsp;<a href="javascript:void(0)"
											onclick="javascript:Select(true)"><s:text name="all" /></a>
										&nbsp;| <a href="javascript:void(0)"
											onclick="javascript:Select(false)"><s:text name="none" /></a>
									</div>
								</th>
							</tr>
							<tr>
								<th><s:text name="roleMenu" /></th>
								<s:iterator status="stat" value="actionMap">
									<th
										style="text-align: center; padding-left: 0 !important; padding-right: 0 !important;"><s:text
											name="%{key}" /></th>
								</s:iterator>
							</tr>
						</thead>
						<tbody>
							<s:if test="listActionMenusEmpty!=null">
								<tr class="odd">
									<td colspan="<s:property value="actionMap.size()+1"/>"
										style="text-align: center; padding-left: 0 !important; padding-right: 0 !important;"><s:property
											value="listActionMenusEmpty" /></td>
								</tr>
							</s:if>
							<s:iterator status="stat" value="listActionMenus">
								<tr class="odd">
									<td style="min-width: 200px;"><label> <s:property
												value="key" />
									</label></td>
									<s:iterator status="stat1" value="value">
										<td align="center"
											style="text-align: center; padding-left: 0 !important; padding-right: 0 !important; min-width: 50px;">
											<s:if test='value!=null && !("").equalsIgnoreCase(value)'>
												<s:if
													test='entitlements!=null && entitlements.size()>0 && entitlements.contains(value)'>
													<s:if
														test='"list".equalsIgnoreCase(value.substring(value.lastIndexOf(".")+1))'>
														<s:checkbox name="entitlements" fieldValue="%{value}"
															value="true" disabled="true" />
														<s:hidden name="entitlements" value="%{value}" />
													</s:if>
													<s:else>
														<s:checkbox name="entitlements" fieldValue="%{value}"
															value="true" cssClass="ckbox" />
													</s:else>
												</s:if>
												<s:else>
													<s:checkbox name="entitlements" fieldValue="%{value}"
														value="false" cssClass="ckbox" />
												</s:else>
											</s:if>
										</td>
									</s:iterator>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
			<div class="yui-skin-sam">
				<span id="button" class=""><span class="first-child">
						<button type="button" class="save-btn btn btn-success">
							<FONT color="#FFFFFF"> <b><s:text name="Save" /></b>
							</FONT>
						</button>
				</span></span><span id="cancel" class=""><span class="first-child"><a
						href="roleEntitlement_list.action" class="cancel-btn btn btn-sts">
							<FONT color="#FFFFFF"> <s:text name="cancel" />
						</FONT>
					</a></span></span>
			</div>
		</div>
	






</s:form>
<script type="text/javascript">
	$(document).ready(function() {
		$('button').on('click', function(e) {
			document.roleform.action = "roleEntitlement_update.action";
			document.getElementById("id").value = "1";
			document.roleform.submit();
		});
	});

	function listview() {
		document.roleform.action = "roleEntitlement_update.action";
		document.roleform.submit();
	}

	function Select(Select) {
		//alert("chl");
		/*        jQuery(".ckbox").attr("checked",Select); */
		$(".ckbox").prop("checked", Select);
		/*  $(".ckbox").prop("checked", false); */
	}
</script>
