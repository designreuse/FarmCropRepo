<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">

</head>


<script type="text/javascript">
$(document).ready(function(){

	jQuery("#detail").jqGrid(
			{
			url:'harvestSeason_data.action?currentPage='+document.updateform.currentPage.value,
			pager: '#pagerForDetail',
			datatype: "json",
			 styleUI : 'Bootstrap',
			 postData:{
   			  "postdata" :  function(){	
   	   			return  decodeURI(postdata);
   			  } 
   	   	},
			colNames:[
			  
		  		   	  '<s:text name="harvestSeason.code" />',
		  		      '<s:text name="%{getLocaleProperty('harvestSeason.name')}" /> ',
		  		   
		  		      '<s:text name="harvestSeason.fromPeriod" />',
		  		   	  '<s:text name="harvestSeason.toPeriod" />'
		  		   	  
		  		   	 
		      	 ],

		   colModel : [
					
		      	      {name:'code',index:'code',sortable:true, width:125},
		      	      {name:'name',index:'name', sortable:true, width:125}, 
		      	   
		      	      {name:'fromPeriod',index:'fromPeriod',sortable:true, width:125,searchoptions:{dataInit:datePick,attr:{readonly:true}}},
		      	      {name:'toPeriod',index:'toPeriod', sortable:true,width:125,searchoptions:{dataInit:datePick,attr:{readonly:true}}},
		      	    
		      	      /* {name:'currentSeason',index:'currentSeason',width:125,sortable: false, width :125, search:true, stype: 'select', searchoptions: { value: ':<s:text name="filter.allStatus"/>;1:<s:text name="status1"/>;0:<s:text name="status0"/>' }}*/
		      	 ],			
		    height: 301, 
			width: $("#baseDiv").width(),
			scrollOffset: 0,
			rowNum:10,
			rowList : [10,25,50],
			sortname: 'id',
			sortorder: 'desc',
			viewrecords: true,
		    onSelectRow: function(id){ 
			  document.updateform.id.value  =id;
			  postDataSubmit();
	          document.updateform.submit();      
			},		
	        onSortCol: function (index, idxcol, sortorder) {
		        if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
	                    && this.p.colModel[this.p.lastsort].sortable !== false) {
	                $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
	            }
	        }
	   });
	jQuery("#detail").jqGrid('navGrid','#pagerForDetail',{edit:false,add:false,del:false,search:false,refresh:true})
	jQuery("#detail").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});		
	retainFields();

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
    postdata =  '';
});

datePick = function(elem)
{	
   jQuery(elem).datepicker({
		   changeYear: true,
	       changeMonth: true,       
	       dateFormat: 'dd-mm-yy',
		   onSelect:function(dateText, inst){	   	 
		   		jQuery("#detail")[0].triggerToolbar();
		   }
	   }
)};


</script>

	<div>
		
			<sec:authorize ifAllGranted="profile.season.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()" class="btn btn-success mb-2 float-right" >Add Season <i class="ri-menu-add-line align-middle ml-2"></i></button>
			</sec:authorize>

</div>

<div>
	 <div class="table-responsive mt-3"  id="baseDiv">
			<table class="table table-centered datatable dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;" id="detail"></table>
			<div id="pagerForDetail"></div>
		</div> 
	</div>
<s:form name="createform" action="harvestSeason_create">
</s:form>

<s:form name="updateform" action="harvestSeason_detail">
	<s:hidden key="id" />
	<s:hidden key="currentPage"/>
	<s:hidden name="postdata" id="postdata" />
</s:form>

