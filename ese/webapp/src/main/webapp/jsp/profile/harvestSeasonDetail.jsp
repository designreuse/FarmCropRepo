<%@ include file="/jsp/common/detail-assets.jsp"%>

<%@ include file="/jsp/common/grid-assets.jsp"%>
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

<s:form name="form" cssClass="fillform">
	<s:hidden key="currentPage" />
	<s:hidden key="id" />
	<s:hidden key="command" />
	<s:hidden key="harvestSeason.id" id="harvestSeasonId" />
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
				<div class="dynamic-flexItem2">
					<p class="form-group code">
						<s:property value="%{getLocaleProperty('harvestSeason.code')}" />
					</p>
					<p class="form-control" name="harvestSeason.code">
						<s:property value="harvestSeason.code" />
					</p>
				</div>

			</div>              
                                 <div class="col-md-4">
				<div class="dynamic-flexItem2">
					<p class="form-group name">
						<s:property value="%{getLocaleProperty('harvestSeason.name')}" />
					</p>
					<p class="form-control" name="harvestSeason.name">
						<s:property value="harvestSeason.name" />
					</p>
				</div>

			</div>      
			
			<div class="col-md-4">
				<div class="dynamic-flexItem2">
					<p class="form-group fromPeriod">
						<s:property value="%{getLocaleProperty('harvestSeason.fromPeriod')}" />
					</p>
					<p class="form-control" name="harvestSeason.fromPeriod">
						<s:property value="fromPeriod" />
					</p>
				</div>

			</div>                      
                                                 
                   			 </div>	
<div class="row">
                               <div class="col-md-4">
				<div class="dynamic-flexItem2">
					<p class="form-group toPeriod">
						<s:property value="%{getLocaleProperty('harvestSeason.toPeriod')}" />
					</p>
					<p class="form-control" name="harvestSeason.toPeriod">
						<s:property value="toPeriod" />
					</p>
				</div>

			</div>             </div>
		
				
	
		
			

</div></div></div>	

 <div class="button-items float-right">
 	<sec:authorize ifAllGranted="profile.season.update">
	<button type="button" id="update" class="btn btn-success waves-effect waves-light">
			<i class="ri-check-line align-middle mr-2"></i>Edit
		</button>
		
		</sec:authorize>
 
 <sec:authorize ifAllGranted="profile.season.delete">
	<button type="button" id="delete" class="btn btn-danger waves-effect waves-light">
			<i class="ri-close-line align-middle mr-2"></i> <s:text name="delete.button" />
		</button>
	</sec:authorize>

<button type="button" id="cancel" class="btn btn-warning waves-effect waves-light">
			<i class="ri-error-warning-line align-middle mr-2"></i><s:text name="back.button" /> 
	</button>
											
 </div>
</s:form>

<s:form name="updateform" action="harvestSeason_update.action">
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="deleteform" action="harvestSeason_delete.action">
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="cancelform" action="harvestSeason_list.action">
	<s:hidden key="currentPage" />
	<s:hidden name="postdata" id="postdata" />
</s:form>


<script type="text/javascript">
    $(document).ready(function () {
        $('#update').on('click', function (e) {
            document.updateform.id.value = document.getElementById('harvestSeasonId').value;
            document.updateform.currentPage.value = document.form.currentPage.value;
            document.updateform.submit();
        });

        $('#delete').on('click', function (e) {
            if (confirm('<s:text name="confirm.delete"/> ')) {
                document.deleteform.id.value = document.getElementById('harvestSeasonId').value;
                document.deleteform.currentPage.value = document.form.currentPage.value;
                document.deleteform.submit();
            }
        });
    });

</script>
