<%-- <%@ include file="/jsp/common/detail-assets.jsp"%> --%>
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
            fill: #B5B5C3; }
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
margin-top: -35px;
}
</style>
</head>
<script src="js/dynamicComponents.js?v=1.19"></script>
<script>
	$(document).ready(function () {
		renderDynamicDetailFeilds();
		
	});
	
	
	function getTxnType(){
		return "381";
	}

    
    function getBranchIdDyn(){
    	return '<s:property value="warehouse.branchId"/>';
   	}
    

    function popDownload(id){
    	document.getElementById("loadId").value=id;
    	$('#audioFileDownload').submit(); 
    	
    }

</script>
<s:form name="form" cssClass="fillform">
	<s:hidden key="currentPage" />
	<s:hidden key="id" />
	<s:hidden key="warehouse.id" />
	<s:hidden key="command" />
	<s:hidden key="warehouse.id" id="coOperativeId" class="uId"/>
	<font color="red"> <s:actionerror /></font>	
			

	
<div id="accordion" class="custom-accordion group_Detail" >
	<div class="card-header card mb-1 shadow-none">
		<a href="#groupDetail" class="text-dark" data-toggle="collapse"
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
								<s:property value="%{getLocaleProperty('info.samithi')}" />
							</h3>
							<div class="wizard-desc">Group Basic Information
								Details</div>
						</div>
					</div>
					<i
						class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
				</h6>
			</div>
		</a>

	</div>
			<div id="groupDetail" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
<div class="card-body" >

<div class="row">

 <div class="col-md-4">
                                                   <div class="form-group ">
						<label for="txt"><s:property value="%{getLocaleProperty('samithi.name')}" />
						</label>
						<div class="form-control">
							<s:property value="warehouse.name" />
						</div>
					</div>
                                                </div>
	 <div class="col-md-4">
                                                   <div class="form-group ">
						<label for="txt"><s:property value="%{getLocaleProperty('dateOfFormation')}" />
						</label>
						<div class="form-control">
							<s:date name="warehouse.formationDate" format="dd/MM/YYYY" />
						</div>
					</div>
                                                </div>		

	</div>							

	</div>
</div>
</div>						

<div class="dynamicFieldsRender"></div>
					<div class="button-items float-right">
					<sec:authorize  access="hasAnyRole('profile.samithi.update','profile.samithi.bci.update')">
				
							
							 <button type="button" id="update" class="btn btn-success waves-effect waves-light">
                                                <i class="ri-check-line align-middle mr-2"></i> <s:text
													name="edit.button" />
                                            </button>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('profile.samithi.delete','profile.samithi.bci.delete')">
							 <button type="button" id="delete" onclick="event.preventDefault();onSubmit();" class="btn btn-danger waves-effect waves-light">
                                                <i class="ri-error-warning-line align-middle mr-2"></i><s:text
													name="delete.button" />
                                            </button>
						</sec:authorize>
					 <button type="button" id="cancel" class="btn btn-primary waves-effect waves-light">
                                                <i class="ri-close-line align-middle mr-2"></i> <s:text name="back.button" />
                                            </button>
					</div>
				
	      


</s:form>

<s:form name="updateform" action="samithi_update.action">
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="deleteform" action="samithi_delete.action">
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="cancelform" action="samithi_list.action">
	<s:hidden key="currentPage" />
</s:form>
		
	




<script type="text/javascript">
    $(document).ready(function () {
    	if('<s:property value="getCurrentTenantId()"/>'== 'susagri'){
    		loadFarmerDetailsGrid();
    		loadIcsDetailsGrid();
    	}
    	
    	if('<s:property value="getCurrentTenantId()"/>' == 'pratibha' && '<s:property value="getBranchId()"/>' == 'bci'){
    		
			$(".breadcrumb").find('li:not(:first)').remove();
			
			
		$(".breadcrumb").append('<li><a href="samithi_list.action">/ <s:property value="%{getLocaleProperty('profile.samithi.bci')}" /></a></li>');
		}
	
        $('#update').on('click', function (e) {
            document.updateform.id.value = document.getElementById('coOperativeId').value;
            document.updateform.currentPage.value = document.form.currentPage.value;
            document.updateform.submit();
        });

        $('#delete').on('click', function (e) {
            if (confirm('<s:text name="confirm.delete"/> ')) {
                document.deleteform.id.value = document.getElementById('coOperativeId').value;
                document.deleteform.currentPage.value = document.form.currentPage.value;
                document.deleteform.submit();
            }
        });
       
    });
    function loadFarmerDetailsGrid(){

	    jQuery("#detail2").jqGrid(
	    {
	    url:'samithiFarmerDetails_data.action?samithiId='+document.getElementById('coOperativeId').value,
	            pager: '#pagerForDetail2',
	            mtype: 'POST',
	            datatype: "json",
	        	colNames:[
			   		'<s:property value="%{getLocaleProperty('Farmer Code By Tracenet')}" />',
			   		'<s:property value="%{getLocaleProperty('Farmer Name')}" />',
			   		'<s:property value="%{getLocaleProperty('City')}" />',
			   		'<s:property value="%{getLocaleProperty('Village')}" />',
			   		'<s:property value="%{getLocaleProperty('Farm Name')}" />',
			   		'<s:property value="%{getLocaleProperty('Inspection Type')}" />',
			   		'<s:property value="%{getLocaleProperty('IC Status')}" />', 
                  	 ],
	 	      	colModel:[
	 	      		{name:'farmersCodeTracenet',index:'FarmersCodeTracenet',sortable:false,frozen:false},
	 	      		{name:'farmerName',index:'farmerName',sortable:false,frozen:false},
	 	      		{name:'city',index:'city',sortable:false,frozen:false},
	 	      		{name:'village',index:'village',sortable:false,frozen:false},
	 	      		{name:'farmName',index:'farmName',sortable:false,frozen:false},
	 	      		{name:'inspType',index:'inspType',sortable:false,frozen:false},
	 	      		{name:'icType',index:'icType',sortable:false,frozen:false}, 
								],
	            height: 301,
	            width: $("#baseDiv").width(), // assign parent div width
	            scrollOffset: 0,
	            rowNum:10,
	            rowList : [10, 25, 50],
	            sortname:'id',
	            sortorder: "desc",
	            viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
	            beforeSelectRow:
	            function(rowid, e) {
	            var iCol = jQuery.jgrid.getCellIndex(e.target);
	            if (iCol >= 4){return false; }
	            else{ return true; }
	            },
	    /*         onSelectRow: function(id){
	            	 document.certificationDetailsform.id.value = id;
	 	            document.certificationDetailsform.tabIndex.value = "#tabs-2";
	 	            document.certificationDetailsform.submit();
	            
	            }, */
	            onSortCol: function (index, idxcol, sortorder) {
	            if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
	                    && this.p.colModel[this.p.lastsort].sortable !== false) {
	            $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
	            }
	            }
	    });
	    jQuery("#detail2").jqGrid('navGrid', '#pagerForDetail2', {edit:false, add:false, del:false, search:false, refresh:true}) // enabled refresh for reloading grid
	            jQuery("#detail2").jqGrid('filterToolbar', {stringResult: true, searchOnEnter : false}); // enabling filters on top of the header.

	    colModel = jQuery("#detail2").jqGrid('getGridParam', 'colModel');
	    $('#gbox_' + jQuery.jgrid.jqID(jQuery("#detail2")[0].id) +
	            ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
	    var cmi = colModel[i], colName = cmi.name;
	    if (cmi.sortable !== false) {
	    $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
	    } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
	    $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
	    }
	    });
	    windowHeight = windowHeight-100;
	    $('#detail2').jqGrid('setGridHeight',(windowHeight));
	    }
    
    function loadIcsDetailsGrid(){

	    jQuery("#detail3").jqGrid(
	    {
	    url:'samithiIcs_data.action?samithiId='+document.getElementById('coOperativeId').value,
	            pager: '#pagerForDetail3',
	            mtype: 'POST',
	            datatype: "json",
	        	colNames:[
			   		'<s:property value="%{getLocaleProperty('fieldStatus')}" />',
			   		'<s:property value="%{getLocaleProperty('Season')}" />',
			   		'<s:property value="%{getLocaleProperty('Scope Validity')}" />',
			   		'<s:property value="%{getLocaleProperty('Scope Certificate')}" />',
			   		
                  	 ],
	 	      	colModel:[
	 	      		{name:'icsType',index:'icsType',sortable:false,frozen:false,search:false},
	 	      		{name:'Season',index:'Season',sortable:false,frozen:false,search:false},
	 	      		{name:'date',index:'date',sortable:false,frozen:false,search:false},
	 	      		{name:'download',index:'download',sortable:false,frozen:false,search:false},
	 	      		
								],
	            height: 301,
	            width: $("#baseDiv").width(), // assign parent div width
	            scrollOffset: 0,
	            rowNum:10,
	            rowList : [10, 25, 50],
	            sortname:'id',
	            sortorder: "desc",
	            viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
	            beforeSelectRow:
	            function(rowid, e) {
	            var iCol = jQuery.jgrid.getCellIndex(e.target);
	            if (iCol >= 4){return false; }
	            else{ return true; }
	            },
	      /*       onSelectRow: function(id){
	            	 document.certificationDetailsform.id.value = id;
	 	            document.certificationDetailsform.tabIndex.value = "#tabs-3";
	 	            document.certificationDetailsform.submit();
	            
	            }, */
	            onSortCol: function (index, idxcol, sortorder) {
	            if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
	                    && this.p.colModel[this.p.lastsort].sortable !== false) {
	            $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
	            }
	            }
	    });
	    jQuery("#detail3").jqGrid('navGrid', '#pagerForDetail3', {edit:false, add:false, del:false, search:false, refresh:true}) // enabled refresh for reloading grid
	            jQuery("#detail3").jqGrid('filterToolbar', {stringResult: true, searchOnEnter : false}); // enabling filters on top of the header.

	    colModel = jQuery("#detail3").jqGrid('getGridParam', 'colModel');
	    $('#gbox_' + jQuery.jgrid.jqID(jQuery("#detail3")[0].id) +
	            ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
	    var cmi = colModel[i], colName = cmi.name;
	    if (cmi.sortable !== false) {
	    $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
	    } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
	    $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
	    }
	    });
	    windowHeight = windowHeight-100;
	    $('#detail3').jqGrid('setGridHeight',(windowHeight));
	    }

</script>