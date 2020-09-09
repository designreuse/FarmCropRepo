<%@ include file="/jsp/common/grid-assets.jsp"%>

<head>
<META name="decorator" content="swithlayout">
</head>
<body>
	<script type="text/javascript">
var type="<%=request.getParameter("type")%>";
$(document).ready(function(){		
	jQuery("#detail").jqGrid(
	{
	   	url:'<%=request.getParameter("type")%>_data.action?type=<%=request.getParameter("type")%>',
	   	pager: '#pagerForDetail',
	   	mtype: 'POST',
	   	datatype: "json",	
	   	styleUI : 'Bootstrap',
	   	colNames:[
			
	  		   	  '<s:text name='%{"agentName"+type}'/>',
	  		      '<s:text name="personalInfo.firstName"/>',
	  		      '<s:text name="personalInfo.lastName"/>',
	  			  '<s:text name="contactInfo.mobileNumber"/>' ,
	  			
	  			  '<s:text name="lastLogin"/>' ,
	  			  '<s:text name="version"/>' ,
	  			  '<s:text name="%{getLocaleProperty('fstLastTime')}"/>' ,
	  			 
	  			  '<s:text name="%{getLocaleProperty('warehouse')}"/>',
	  			
	  		      '<s:text name="personalInfo.bodStatus" />'      
	      	 ],
	   	colModel:[						

	   		{name:'profileId',index:'profileId',width:125,sortable:true,search:false},
	   		{name:'pI.firstName',index:'pI.firstName',width:125,sortable:true,search:false},
	   		{name:'pI.lastName',index:'pI.lastName',width:125,sortable:true,search:false},
	   		{name:'cI.mobileNumber',index:'cI.mobileNumber',width:125,sortable:true,search:false},
	   		
	   		{name:'lastLogin',index:'lastLogin',width:125,sortable:true,search:false},
	   		{name:'version',index:'version',width:125,sortable:true,search:false},
	   		{name:'fstLastTime',index:'fstLastTime',width:125,sortable:true,search:false},
	   		
	   	
	   		{name:'warehouse',index:'agentWarehouse',width:125,sortable:true,search:false},
	   		
	   		{name:'bodStatus',index:'bodStatus',width:125,sortable: false, width :125, search:true, stype: 'select', searchoptions: { value: '-1:<s:text name="filter.allStatus"/>;1:<s:text name="bodStatus1"/>;0:<s:text name="bodStatus0"/>' }}
	   		
	   	],
	   	height: 501, 
	    width: $("#baseDiv").width(), // assign parent div width
	    scrollOffset: 0,
	   	rowNum:15,
	   	rowList : [15,30,45],
	    sortname:'id',			  
	    sortorder: "desc",
	    pager: "#pagerForDetail",
	    viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
	    onSelectRow: function(id){ 
		  document.updateform.id.value  =id;
          document.updateform.submit();      
		},		
 
    });
	
	
	jQuery("#detail").jqGrid('navGrid','#pagerForDetail',{edit:false,add:false,del:false,search:false,refresh:false}) // enabled refresh for reloading grid

});	      
</script>

<div>

		<sec:authorize ifAllGranted="profile.agent.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()" class="btn btn-success mb-2 float-right" >Add Agent <i class="ri-menu-add-line align-middle ml-2"></i></button>
			</sec:authorize>
	</div>
	
	<div>
	  <div class="responsiveDiv table table-striped table-hover my-5"  id="baseDiv">
			<table class="table table-centered datatable dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;" id="detail"></table>
			<div id="pagerForDetail"></div>
		</div> 
	</div>
	
	
	<s:form name="createform" action="%{type}_create?type=%{type}">
	</s:form>
	<s:form name="updateform" action="%{type}_detail?type=%{type}">
		<s:hidden name="id" />
		<s:hidden name="currentPage" />
	</s:form>
</body>
