<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
	<META name="decorator" content="swithlayout">
</head>
<script type="text/javascript">
	$(document).ready(function(){
		
		var tenant='<s:property value="getCurrentTenantId()"/>';
		$(".breadcrumb ol").children('li').eq(1).empty();
		//alert('<s:property value="getBranchId()"/>');
		if('<s:property value="getCurrentTenantId()"/>' == 'pratibha' && '<s:property value="getBranchId()"/>' == 'bci'){
			//alert($(".breadcrumb ol").children('li').eq(1));
			$(".breadcrumb").find('li:not(:first)').remove();
			
			
		$(".breadcrumb").append('<li><a href="samithi_list.action">  /  <s:property value="%{getLocaleProperty('profile.samithi.bci')}" /></a></li>');
		}
	
		jQuery("#detail").jqGrid(
		{
		   	url:'samithi_data.action',
		   	pager: '#pagerForDetail',	  
		   	datatype: "json",	
		   	mtype: 'POST',
		    styleUI : 'Bootstrap',
		   	colNames:[
			 
		  		   	  '<s:text name="samithi.code"/>',
		  		    '<s:property value="%{getLocaleProperty('samithi.name')}" />',
		  		  <s:if test="isKpfBased==1">
		  		  <s:if test="currentTenantId!='gsma'">
		  		  '<s:property value="%{getLocaleProperty('samithi.type')}" />',
		  		</s:if>
		  		    </s:if>
		  		  <s:if
					test="getCurrentTenantId()=='symrise'">
				
		  		  '<s:property value="%{getLocaleProperty('dateOfFormation')}" />',
		  		</s:if>
		  		<s:if test="getCurrentTenantId()=='susagri'">
	
		  		'<s:text name="Farmer Count"/>',
		  		'<s:text name="Crop Area"/>' 
		  		</s:if>
		      	 	 ],
		   	colModel:[
				
		   		{name:'code',index:'code',width:125,sortable:true},
		   		{name:'name',index:'name',width:125,sortable:true},
		   	 <s:if test="isKpfBased==1">
		   	 <s:if test="currentTenantId!='gsma'">
		   
		   		{name:'groupType',index:'groupType',width:125,sortable: false, width :125, search:true, stype: 'select', searchoptions: { value: ':<s:text name="allanswer"/>;4:<s:text name="masterType4"/>;11:<s:text name="masterType11"/>' }}
		   		</s:if>	</s:if>
		  	  <s:if
				test="getCurrentTenantId()=='symrise'">
				{name:'dof',index:'dof',width:125,sortable:true,search:false},
		  		</s:if>
				<s:if test="getCurrentTenantId()=='susagri'">
				{name:'count',index:'count',width:125,sortable:false,search:false},
				{name:'cropArea',index:'cropArea',width:125,sortable:false,search:false}
				</s:if>
		   			 ],
		   	height: 301, 
		    width: $("#baseDiv").width(), // assign parent div width
		    scrollOffset: 0,
		   	rowNum:10,
		   	rowList : [10,25,50],
		    sortname:'id',			  
		    sortorder: "desc",
		    viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
		    onSelectRow: function(id){ 
			  document.updateform.id.value  =id;
		      document.updateform.submit();      
			},		
	        onSortCol: function (index, idxcol, sortorder) {
		        if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
	                    && this.p.colModel[this.p.lastsort].sortable !== false) {
	                $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
	            }
	        }
		});
		
		jQuery("#detail").jqGrid('navGrid','#pagerForDetail',{edit:false,add:false,del:false,search:false,refresh:true}) // enabled refresh for reloading grid
		jQuery("#detail").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false}); // enabling filters on top of the header.

		colModel = jQuery("#detail").jqGrid('getGridParam', 'colModel');
	    $('#gbox_' + $.jgrid.jqID(jQuery("#detail")[0].id) +
	        ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
	        var cmi = colModel[i], colName = cmi.name;

	        if (cmi.sortable !== false) {
	            $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
	        } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
	            $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
	        }
	    });
	}); 
	
	function getBranchIdDyn(){
		return null;
	}
</script>
<div>
<sec:authorize access="hasAnyRole('profile.samithi.create','profile.samithi.bci.create')">
	<button type="BUTTON" id="add" class="btn btn-success mb-2 float-right"  onclick="document.createform.submit()" ><s:property value="%{getLocaleProperty('Add Group')}" /><i class="ri-menu-add-line align-middle ml-2"></i> </button>
</sec:authorize>

</div>
<div>
	 <div class="table-responsive mt-3"  id="baseDiv">
			<table class="table table-centered datatable dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;" id="detail"></table>
			<div id="jqGridPager"></div>
		</div> 
	</div>

<s:form name="createform" action="samithi_create">
</s:form>
<s:form name="updateform" action="samithi_detail">
	<s:hidden key="id" />
	<s:hidden key="currentPage"/>
</s:form>