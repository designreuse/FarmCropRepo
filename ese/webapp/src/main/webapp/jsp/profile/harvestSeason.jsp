<%@ include file="/jsp/common/form-assets.jsp"%>
<%@ include file="/jsp/common/detail-assets.jsp"%>
<head>
<!-- add this meta information to select layout  -->
<meta name="decorator" content="swithlayout">
<style>
.hide {
  display: none; }
  
 .wizard-wrapper {
          display: -webkit-box;
          display: -ms-flexbox;
          display: flex; }
.wizard-icon {
          font-size: 2.5rem;
          margin-right: 1.1rem;
          -webkit-transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, -webkit-box-shadow 0.15s ease;
          transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, -webkit-box-shadow 0.15s ease;
          transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease;
          transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease, -webkit-box-shadow 0.15s ease; }
.wizard-icon .svg-icon svg g [fill] {
            -webkit-transition: fill 0.3s ease;
            transition: fill 0.3s ease;
            fill: #5664d2; }
.wizard-icon .svg-icon svg:hover g [fill] {
            -webkit-transition: fill 0.3s ease;
            transition: fill 0.3s ease; }
.wizard-label {
          display: -webkit-box;
          display: -ms-flexbox;
          display: flex;
          -webkit-box-orient: vertical;
          -webkit-box-direction: normal;
          -ms-flex-direction: column;
          flex-direction: column;
          -webkit-box-pack: center;
          -ms-flex-pack: center;
          justify-content: center; }
.wizard-label .wizard-title {
            color: #181C32;
            font-weight: 500;
            font-size: 1.1rem; }
.wizard-label .wizard-desc {
            color: #7E8299; }
.collapse-icon-custom{
    display: inline-block;
    width: 24px;
    height: 24px;
    line-height: 24px;
    font-size: 16px;
    background-color: #5664d2;
    color: #fff;
    border-radius: 50%;
    text-align: center;
    left: 10px;
    top: 50%;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
}
</style>
</head>
<body>


	<s:form name="form" cssClass="fillform" action="harvestSeason_%{command}">
		<s:hidden key="currentPage" />
		<s:hidden key="id" />
		<s:if test='"update".equalsIgnoreCase(command)'>
			<s:hidden key="harvestSeason.id" />
		</s:if>
		<s:hidden key="command" />
		<s:hidden id="fromPeriod" />
		<s:hidden id="toPeriod" />

	<div class="ferror" id="errorDiv" class=" hide alert alert-danger" >
					<s:actionerror theme="bootstrap" />
					<s:fielderror theme="bootstrap" />
				</div> 
				
	<div id="accordion" class="custom-accordion season_info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#seasonInfo" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseOne">
                                                    <div class="card-header" id="headingOne">
                                                        <h6 class="m-0">
                                                        <div class="wizard-wrapper">
															<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x">
																	<!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg>
																	<!--end::Svg Icon-->
																</span>
															
															</div>
																<div class="wizard-label">
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('info.harvestSeason')}" /></h3>
																<div class="wizard-desc">Setup Harvest Season Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="seasonInfo" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">

				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group name">
						<label for="txt"><s:text name="%{getLocaleProperty('harvestSeason.name')}" /> <sup
									style="color: red;">*</sup></label>
						<div class="">
							<s:textfield name="harvestSeason.name" maxlength="35" cssClass="form-control " />
						</div>
					</div>
                                                </div>
                                                <div class="col-md-4">
                                                   	<div class="form-group fromPeriod">
						<label for="txt"><s:text name="harvestSeason.fromPeriod" /><sup style="color: red;">*</sup> </label>
						<div class="">
						<s:textfield data-date-format="dd/mm/yyyy" data-date-viewmode="years" cssClass="form-control" id="fromDate"
										name="fromPeriod" readonly="true" />
						</div>
					</div>
                                                </div>
                                                
                                                
                                       <div class="col-md-4">
                                                   	<div class="form-group toPeriod">
						<label for="txt"><s:text name="harvestSeason.toPeriod" /><sup style="color: red;">*</sup> </label>
						<div class="">
							<s:textfield data-date-format="dd/mm/yyyy" data-date-viewmode="years" cssClass="form-control" id="toDate"
										name="toPeriod" readonly="true" />
						</div>
					</div>
                                                </div>               
                                                
                                                
                   			 </div>	

		
				
	
		
			

</div></div></div>
      <div class="button-items float-right">
        
                                            <s:if test="command =='create'">
                                            <button type="submit" id="buttonAdd1" onclick="event.preventDefault();onSubmit();"class="btn btn-success waves-effect waves-light">
                                                <i class="ri-check-line align-middle mr-2"></i> Save
                                            </button></s:if>
                                            <s:else>
                                            <button type="submit" id="buttonUpdate" onclick="event.preventDefault();onSubmit();" class="btn btn-primary waves-effect waves-light">
                                                <i class="ri-error-warning-line align-middle mr-2"></i> Update
                                            </button></s:else>
                                            <button type="button" onclick="onCancel();" class="btn btn-danger waves-effect waves-light">
                                                <i class="ri-close-line align-middle mr-2"></i> Cancel
                                            </button>
                                        </div> 

	</s:form>
	<s:form name="cancelform" action="harvestSeason_list.action">
		<s:hidden key="currentPage" />
	</s:form>


	<script type="text/javascript">
		$("#fromCalendar").datepicker({
			format : "mm/yyyy",
			startView : "months",
			minViewMode : "months"
		});

		$("#toCalendar").datepicker({
			format : "mm/yyyy",
			startView : "months",
			minViewMode : "months"
		});

		function onSubmit() {

			if ('<s:property value="getCurrentTenantId()"/>' == 'pratibha') {
				var startDate = new Date(fomatDate(document
						.getElementById("fromCalendar").value));
				var sDate = getFormattedDate(startDate);
				var endDate = new Date(fomatDate(document
						.getElementById("toCalendar").value));
				var eDate = getFormattedDate(endDate);
				if (sDate > eDate) {
					alert('<s:text name="date.range"/>');
				} else {
					/* document.getElementById("fromPeriod").value = document.getElementById("fromCalendar").value;
					document.getElementById("toPeriod").value = document.getElementById("toCalendar").value; */
					document.getElementById("fromCalendar").value = sDate;
					document.getElementById("toCalendar").value = eDate;
					document.form.submit();
				}
			} else {
					var startDate = new Date(fomatDateOther(document
							.getElementById("fromDate").value));
					var endDate = new Date(fomatDateOther(document
							.getElementById("toDate").value));
					if (startDate > endDate) {
						alert('<s:text name="date.range"/>');
					} else {
						document.getElementById("fromPeriod").value = document
								.getElementById("fromDate").value;
						document.getElementById("toPeriod").value = document
								.getElementById("toDate").value;
						document.form.submit();
					}
				
			}
		}

		function fomatDate(date) {
			var dateArr = date.split("/");
			return dateArr[0] + "/01/" + dateArr[1];
		}
		function fomatDateOther(date) {
			var dateArr = date.split("/");
			return dateArr[1] + "/" + dateArr[0] + "/" + dateArr[2];
		}
		function getFormattedDate(date) {
			var year = date.getFullYear();
			var month = (1 + date.getMonth()).toString();
			month = month.length > 1 ? month : '0' + month;
			return month + '/' + year;

		}
	</script>

</body>