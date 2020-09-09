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

			<div class="error">
				<s:actionerror />
				<s:fielderror />
				<sup>*</sup>
				<s:text name="reqd.field" />
			</div>
			
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
									<div class="wizard-desc">Role menu details</div>
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
								<s:select id="selectedRole" name="selectedRole" list="roles"
								listKey="id" listValue="name" theme="simple"
								onchange="listview()" headerKey="-1"
								headerValue="%{getText('txt.select')}"
								cssClass="col-md-6 form-control select2" />
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group farmerCode">
							<label for="txt"> <s:text name="parentMenu" /><sup
								style="color: red;">*</sup>
							</label>
							<div class="">
								<s:select id="selectedParentMenu" name="selectedParentMenu"
								list="parentMenus" headerKey="-1"
								headerValue="%{getText('txt.select')}" theme="simple"
								onchange="listview()" cssClass="form-control input-sm select2" />
							</div>
						</div>
					</div>



				</div>


			</div>
		</div>
			<!-- new design end -->
			
			<div class="formContainerWrapper">
				<%-- <h2>
					<s:text name="info.roleMenu" />
				</h2> --%>

				<div class="flexiWrapper">
					<s:if test='branchId==null'>
						<!-- <div class="flexi flexi10">
							<label for="txt"><s:text name="app.branch" /></label>
							<div class="form-element">
								<s:select name="branchId_F" theme="simple" listKey="key"
									listValue="value" list="branchesMap" headerKey="-1"
									headerValue="%{getText('txt.select')}"
									onchange="populateRoles(this)"
									cssClass="form-control input-sm select2" />
							</div>
						</div>  -->
					</s:if>
					<s:else>
						<s:if test='branchId==null'>
							<div class="flexi flexi10">
								<s:label theme="simple">
									<s:text name="app.branch" />
									<sup> *</sup>
								</s:label>

								<div class="form-element">
									<s:select name="branchId_F" theme="simple" listKey="key"
										listValue="value" list="branchesMap" headerKey="-1"
										headerValue="%{getText('txt.select')}"
										onchange="populateRoles(this)"
										cssClass="form-control input-sm select2" />
								</div>
							</div>
						</s:if>
					</s:else>
					<%-- <div class="flexi flexi10">
						<label class="alignTopLeft"> <s:text name="Role" /><sup>
								*</sup>
						</label>

						<div class="form-element">
							<s:select id="selectedRole" name="selectedRole" list="roles"
								listKey="id" listValue="name" theme="simple"
								onchange="listview()" headerKey="-1"
								headerValue="%{getText('txt.select')}"
								cssClass="col-sm-4 form-control select2" />
						</div>
					</div>

					<div class="flexi flexi10">
						<label class="alignTopLeft"> <s:text name="parentMenu" />
						</label>
						<div class="form-element">
							<s:select id="selectedParentMenu" name="selectedParentMenu"
								list="parentMenus" headerKey="-1"
								headerValue="%{getText('txt.select')}" theme="simple"
								onchange="listview()" cssClass="form-control input-sm select2" />
						</div>
					</div> --%>

				</div>
				

			</div>
			<div class="appContentWrapper marginBottom">
				<div class="row">
					<div class="col-sm-12">
						<table id="tablediv" class="table table-hover aspect-detail">
						</table>
					</div>
				</div>
				<div id="EditDiv" class="yui-skin-sam">
				<sec:authorize ifAllGranted="profile.role.menu.update">
					<span id="button" class=""><span class="first-child">
							<button id="but2" type="button" class="save-btn btn btn-success">
								<FONT color="#FFFFFF"> <b><s:text name="Edit" /></b>
								</FONT>
							</button>
					</span></span>
				</sec:authorize>
			</div>
			</div>
			

</s:form>
<br>
<br>

<script type="text/javascript">
	
	
	$(document)
			.ready(
					function() {
						
						
						listview();
						$('button')
								.on(
										'click',
										function(e) {
											var selectedRoleValue = document
													.getElementById('selectedRole');
											var strUser = selectedRoleValue.options[selectedRoleValue.selectedIndex].text;
											//if(strUser!="Admin")
											{
												document.roleform.action = "roleMenu_update.action";
												document.roleform.submit();
											}
										});
					});

	function listview() {
		
		var selectedRoleValue = document.getElementById('selectedRole');
		var strUser = selectedRoleValue.options[selectedRoleValue.selectedIndex].text;

		$
				.post(
						"roleMenu_data",
						{
							selectedRole : $("#selectedRole").val(),
							selectedParentMenu : $("#selectedParentMenu").val()
						},
						function(data) {
							var result = data;
							var arry = populateValues(result);

							$("#tablediv tbody tr").each(function() {
								this.parentNode.removeChild(this);
							});

							var tab = document.getElementById('tablediv');
							var tbo = document.createElement('tbody');
							var headerrow = document.createElement('tr');
							var header = document.createElement('th');
							header
									.appendChild(document
											.createTextNode('<s:text name="submenu" />'));
							headerrow.appendChild(header);
							tbo.appendChild(headerrow);
							var row, cell;
							for (var i = 0; i < arry.length; i++) {
								row = document.createElement('tr')
								$(row).addClass('odd');
								cell = document.createElement('td');
								cell
										.appendChild(document
												.createTextNode(arry[i] == "" ? '<s:text name="records.empty" />'
														: arry[i]))
								row.appendChild(cell);
								tbo.appendChild(row);
							}

							tab.appendChild(tbo);
						});

		if (strUser != "Admin") {
			removeCls();
		} else {
			chngeCls();
		}
	}

	function chngeCls() {
		//alert("3");
		//document.getElementById('button-button').className += 'disableBtn';
		$("#button-button").addClass("disableBtn");
		$("#button-button > font").css("color", "#acacac!important");
	}

	function removeCls() {
		//alert("3");
		//document.getElementById('button-button').className += 'disableBtn';
		$("#button-button").removeClass("disableBtn");
		$("#button-button > font").css("color", "#fff!important");
	}

	function populateRoles(obj) {
		var branchId = $(obj).val();
		reloadSelect('#selectedRole', 'user_populateRoles.action?branchId_F='
				+ branchId);
	}

	function populateRoleMulti(obj) {
		var branchId = $(obj).val();
		if (isEmpty(branchId)) {
			branchId = $("#branchSelect").val();
		}
		reloadSelect('#selectRole', 'user_populateRoles.action?branchId_F='
				+ branchId);
	}
	
	function reloadSelect(element, url) {
	    var headerKey = $(element + " option:first").val();
	    var headerValue = $(element + " option:first").text();
	    $.getJSON(url, function (jd) {
	        var jsonArray = jd.maps;
	        populateSelect(element, jsonArray, headerKey, headerValue);
	    });
	}
	
	function populateSelect(element, jsonArray, headerKey, headerValue) {
	    $(element).empty();
	    $(element).append('<option value="' + headerKey + '">' + headerValue + '</option>');

	    for (var i = 0; i < jsonArray.length; i++) {
	        var jsonObj = jsonArray[i];
	        $.each(jsonObj, function (k, v) {
	            $(element).append('<option value="' + k + '">' + v + '</option>');
	        });
	    }
	    jQuery(element).select2();
	}
	
</script>
