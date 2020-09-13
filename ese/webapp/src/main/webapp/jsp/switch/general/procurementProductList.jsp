<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">

</head>
<script type="text/javascript">
var loadVariety='';
var loadUnit='';
	var loadCrop='';
var tenant='<s:property value="getCurrentTenantId()"/>';
if(tenant=='chetna')
{
	$("#mspDiv").show();	
}
else
{
	$("#mspDiv").hide();	
}
$(document).ready(function(){
	 $('#add').click(function() {
	        $('#cropAccordian').toggle();
	    });
	
	
	 
	loadCropGrid();
	loadVarietyGrid();
	loadGradeGrid();
	$(".select2").select2();
	$('.ui-jqgrid .ui-jqgrid-bdiv').css('overflow-x', 'hidden');
});


function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}


function isDecimal(evt) {

	 evt = (evt) ? evt : window.event;
	  var charCode = (evt.which) ? evt.which : evt.keyCode;
	  if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
	    return false;
	  }
	  return true;
}



function loadCropGrid()
{
	var unit = $.ajax({url: 'procurementProductEnroll_populateUnit.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Countries.');}}).responseText;
	loadUnit=unit.replace("{","").replace("}","");
	
	var cropCategory = $.ajax({url: 'procurementProductEnroll_populateCropCategory.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Countries.');}}).responseText;
	loadCropCategory=cropCategory.replace("{","").replace("}","");
	
	//alert(loadUnit);
	jQuery("#detail").jqGrid(
			{
			   	url:'procurementProductEnroll_data.action',
			   	pager: '#pagerForDetail',	
			   	styleUI : 'Bootstrap',
			   	datatype: "json",	
			   	mtype: 'POST',
				editurl:'procurementProductEnroll_update.action',
			   	colNames:[
						
			  		   	  '<s:text name="product.code"/>',
			  		      '<s:text name="product.name"/>',
			  		    '<s:text name="product.unit"/>',			
			  		    '<s:text name="Actions"/>'
			      	 	 ],
			   	colModel:[	
						
			   		{name:'code',index:'code',width:125,sortable:true,search:false},
			   		{name:'cropName',index:'cropName',width:125,search:false,sortable:true,editable:true},
			   		{name:'unit',index:'unit',sortable:false,search:false, width:40,edittype: "select", editrules: { required: true }},				
			   		{name:'act',index:'act',width:40,formatter:"actions",
			   		
			   			formatoptions: {
                            keys: true, 
                          
                            delOptions: { 
                            	url: 'procurementProductEnroll_populateDelete.action',
                            	afterShowForm:function ($form) {
                            	    $form.closest('div.ui-jqdialog').position({
                            	        my: "center",
                            	        of: $("#detail").closest('div.ui-jqgrid')
                            	    });
                            	},
                            	
                              afterSubmit: function(data) 
                                {
                                	var json = JSON.parse(data.responseText);
									//document.getElementById("validateErrorCate").innerHTML=json.msg;
									jQuery("#detail").jqGrid('setGridParam',{url:"procurementProductEnroll_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
									showPopup(json.msg,json.title);
									jQuery.post("procurementVariety_populateCrop.action",function(result){
										insertOptions("selectedCrop",JSON.parse(result));
										insertOptions("procurementProductId",JSON.parse(result));
										jQuery('.ui-jqdialog-titlebar-close').click();
									});
                                }
                            },
                            afterSave: function (id, response, options) {
                                var json = JSON.parse(response.responseText);
								jQuery("#detail").jqGrid('setGridParam',{url:"procurementProductEnroll_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
								
								showPopup(json.msg,json.title);
								jQuery.post("procurementVariety_populateCrop.action",function(result){
									insertOptions("selectedCrop",JSON.parse(result));
									insertOptions("procurementProductId",JSON.parse(result));
								jQuery('.ui-jqdialog-titlebar-close').click();
								});
                            }
                        }
			    	 }
			   			 ],
			   	height: 301, 
			    width: $("#baseDiv").width(), // assign parent div width
			    scrollOffset: 0,
			   	rowNum:10,
			   	rowList : [10,25,50],
			    sortname:'id',			  
			    sortorder: "desc",
			    viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
			   /*  onSelectRow: function(id){ 
				  document.updateform.id.value  =id;
			      document.updateform.submit();      
				},	 */	
		        onSortCol: function (index, idxcol, sortorder) {
			        if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
		                    && this.p.colModel[this.p.lastsort].sortable !== false) {
		                $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
		            }
		        },
 			loadComplete: function() {
 					 $('#detail').setColProp('unit', { editoptions: { value: loadUnit} });
 					 $('#detail').setColProp('cropCategory', { editoptions: { value: loadCropCategory} });
		      	$(".ui-inline-save span").removeClass("glyphicon").removeClass("glyphicon-save");
		       		$(".ui-inline-save span").addClass("fa").addClass("fa-save").addClass("inline-gridSave");
		       		$(".ui-inline-cancel span").removeClass("glyphicon").removeClass("glyphicon-remove-circle");
		       		$(".ui-inline-cancel span").addClass("fa").addClass("fa-close").addClass("inline-gridSave");
		       		jQuery("#vareityDetail").jqGrid('setGridParam',{url:"procurementVariety_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
		       		jQuery("#gradeDetail").jqGrid('setGridParam',{url:"procurementGrade_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
				 $(".ui-inline-save span").html('<i class="fa fa-floppy-o fa-4 inline-gridSave" aria-hidden="true"></i>');
		       		
		        }
			});
			jQuery("#detail").jqGrid('navGrid','#pagerForDetail',{edit:false,add:false,del:false,search:false,refresh:true}) // enabled refresh for reloading grid
			
			//jQuery("#detail").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false}); // enabling filters on top of the header.
		/* 	 $('#detail').jqGrid('setGridHeight',(windowHeight));  */
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
		   
}


function loadVarietyGrid(){
	var crop = $.ajax({url: 'procurementVariety_populateProcurementProduct.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Crops.');}}).responseText;
	loadCrop=crop.replace("{","").replace("}","");
	
		jQuery("#vareityDetail").jqGrid(
		{
		   	url:'procurementVariety_data.action',
		   	pager: '#pagerForDetailVariety',	  
		   	datatype: "json",
		   	styleUI : 'Bootstrap',
		   	editurl:'procurementVariety_update.action',
		   	mtype: 'POST',
		   	colNames:[
		  		   	  '<s:text name="procurementVariety.code"/>',
		  		    '<s:text name="crop"/>',
		  		      '<s:text name="procurementVariety.name"/>',
		  		    <s:if test="currentTenantId!='olivado'">	
		  		    '<s:text name="procurementVariety.noDaysToGrow"/>',
		  		  '<s:text name="%{getLocaleProperty('procurementVariety.yield')}"/>',
		  		 '<s:text name="%{getLocaleProperty('procurementVariety.harvDays')}"/>',
		  		 </s:if>
		  		    '<s:text name="Actions"/>'
		      	 	 ],
		   	colModel:[			
		   		{name:'code',index:'code',width:60,sortable:true},
		   		{name:'procurementProductId',index:'procurementProductId',sortable:false, width:100,
					 edittype: "select", editrules: { required: true } 	
				
				
				},
		   		{name:'varietyName',index:'varietyName',width:125,sortable:true,editable:true},
		   		 <s:if test="currentTenantId!='olivado'">	
		   		{name:'noDaysToGrow',index:'noDaysToGrow',width:125,sortable:true,editable:true,align:"right"},
		   		{name:'varietyYield',index:'varietyYield',width:125,sortable:true,editable:true,align:"right"},
		   		{name:'harvestDays',index:'harvestDays',width:100,sortable:true,editable:true,align:"right"},
		   	 </s:if>
		   		{name:'act',index:'act',width:40,sortable:false,formatter: "actions",search:false,
                        formatoptions: {
                            keys: true, 
                          
                            delOptions: { 
                            	url: 'procurementVariety_populateDelete.action',
                            	afterShowForm:function ($form) {
                            	    $form.closest('div.ui-jqdialog').position({
                            	        my: "center",
                            	        of: $("#vareityDetail").closest('div.ui-jqgrid')
                            	    });
                            	},
                            	
                            	
                              afterSubmit: function(data) 
                                {
                                	var json = JSON.parse(data.responseText);
									//document.getElementById("validateErrorCate").innerHTML=json.msg;
									jQuery("#vareityDetail").jqGrid('setGridParam',{url:"procurementVariety_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
									showPopup(json.msg,json.title);
									jQuery.post("procurementGrade_populateVariety.action",function(result){
										insertOptions("selectedVariety",JSON.parse(result));
										insertOptions("procurementVarietyId",JSON.parse(result));
										
									});
									jQuery('.ui-jqdialog-titlebar-close').click();
                                }
                            },
                            
                     
                            
                            afterSave: function (id, response, options) {
                                var json = JSON.parse(response.responseText);
								jQuery("#vareityDetail").jqGrid('setGridParam',{url:"procurementVariety_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
								showPopup(json.msg,json.title);
								jQuery.post("procurementGrade_populateVariety.action",function(result){
									insertOptions("selectedVariety",JSON.parse(result));
									insertOptions("procurementVarietyId",JSON.parse(result));
									jQuery('.ui-jqdialog-titlebar-close').click();
								});
                            }
                            
                        }
			    	 }
		   			 ],
		   	height: 301, 
		    width: $("#baseDiv").width(), // assign parent div width
		    scrollOffset: 0,
		   	rowNum:10,
		   	rowList : [10,25,50],
		    sortname:'id',			  
		    sortorder: "desc",
		    viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
		   /*  onSelectRow: function(id){ 
			  document.detailform.id.value  =id;
		      document.detailform.submit();      
			},		 */
	        onSortCol: function (index, idxcol, sortorder) {
		        if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
	                    && this.p.colModel[this.p.lastsort].sortable !== false) {
	                $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
	            }
	        },
	        
	        loadComplete: function() {
	      		$('#vareityDetail').setColProp('procurementProductId', { editoptions: { value: loadCrop} });
	       		$(".ui-inline-save span").removeClass("glyphicon").removeClass("glyphicon-save");
	       		$(".ui-inline-save span").addClass("fa").addClass("fa-save").addClass("inline-gridSave");
	       		$(".ui-inline-cancel span").removeClass("glyphicon").removeClass("glyphicon-remove-circle");
	       		$(".ui-inline-cancel span").addClass("fa").addClass("fa-close").addClass("inline-gridSave");
	       		jQuery("#gradeDetail").jqGrid('setGridParam',{url:"procurementGrade_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
					//$(".ui-inline-save span").html('<i class="fa fa-floppy-o fa-4 inline-gridSave" aria-hidden="true"></i>');
	       		
	        }
		});
		
		jQuery("#vareityDetail").jqGrid('navGrid','#pagerForDetailVariety',{edit:false,add:false,del:false,search:false,refresh:true}) // enabled refresh for reloading grid
		jQuery("#vareityDetail").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false}); // enabling filters on top of the header.

		colModel = jQuery("#vareityDetail").jqGrid('getGridParam', 'colModel');
	    $('#gbox_' + $.jgrid.jqID(jQuery("#vareityDetail")[0].id) +
	        ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
	        var cmi = colModel[i], colName = cmi.name;

	        if (cmi.sortable !== false) {
	            $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
	        } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
	            $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
	        }
	    });
	
}

function loadGradeGrid(){
	
	var variety = $.ajax({url: 'procurementGrade_populateProcurementVariety.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Countries.');}}).responseText;
	 loadVariety=variety.replace("{","").replace("}","");
	
	var unit = $.ajax({url: 'procurementGrade_populateUnit.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Countries.');}}).responseText;
	 loadUnit=unit.replace("{","").replace("}","");
	
	var crop = $.ajax({url: 'procurementVariety_populateProcurementProduct.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Countries.');}}).responseText;
	 loadCrop=crop.replace("{","").replace("}","");
	
		jQuery("#gradeDetail").jqGrid(
		{
		   	url:'procurementGrade_data.action',
		   	pager: '#pagerForDetailGrade',	  
		   	datatype: "json",	
		   	styleUI : 'Bootstrap',
		   	editurl:'procurementGrade_update.action',
		   	mtype: 'POST',
		   	colNames:[
		  		   	  '<s:text name="procurementGrade.code"/>',
		  		   	'<s:text name="crop"/>',
		  		    '<s:text name="%{getLocaleProperty('variety')}"/>',
		  		      '<s:text name="procurementGrade.name"/>',
		  		   // '<s:text name="unit"/>',
		  		    
		  		      '<s:text name="procurementGrade.price"/>',
		  		    '<s:text name="Actions"/>'
		      	 	 ],
		   	colModel:[			
		   		{name:'code',index:'code',width:125,sortable:true},
		   		
		   		
		   		
		   		{name:'procurementProductId',index:'procurementProductId',sortable:false, width:40,editable: true,
					 edittype: "select", editrules:{required: true},
					 
					 editoptions: {
	                		dataEvents: [ 
	   			   			          {
	   			   			            type: "change",
	   			   			            fn: function () {
	   			   			            	var id=$(this).closest('tr').attr('id')+"_procurementVarietyId";
	   			   			         		populateVarietyEdit($(this).val(),id);
	   			   			            }
	   			   			        }]
	                        }	
				
	                
				},
				
				
				{name:'procurementVarietyId',index:'procurementVarietyId',sortable:false, width:40,editable: true,
					 edittype: "select", editrules:{required: true},
	                 
				
				},
				
		   		/* {name:'procurementVarietyId',index:'procurementVarietyId',sortable:false, width:40,editable: true,
					 edittype: "select", editrules: { required: true } 	
				
				
				}, */
		   		{name:'gradeName',index:'gradeName',width:125,sortable:true,editable: true},
		   		/*{name:'selectedUnit',index:'selectedUnit',sortable:false, width:40,editable: true,
					 edittype: "select", editrules: { required: true } 	
				
				
				},*/
		   		{name:'gradePrice',index:'gradePrice',width:125,sortable:true,align:'right',editable: true,},
		   		{name:'act',index:'act',width:40,sortable:false,formatter: "actions",search:false,
		   		
                    formatoptions: {
                        keys: true, 
                        onEdit : function(val){
                        	var dataa = {
                        			procurementProductId:jQuery('#' + val + '_procurementProductId').val(),
			   				}
                        	getAjaxValue("procurementGrade_populateVariety",dataa,val,"_procurementVarietyId"); 
                        	
                        }, 
                    
                        delOptions: { 
                        	url: 'procurementGrade_populateDelete.action',
                        	afterShowForm:function ($form) {
                        	    $form.closest('div.ui-jqdialog').position({
                        	        my: "center",
                        	        of: $("#gradeDetail").closest('div.ui-jqgrid')
                        	    });
                        	},
                        	
                          afterSubmit: function(data) 
                            {
                            	var json = JSON.parse(data.responseText);
								//document.getElementById("validateErrorCate").innerHTML=json.msg;
								jQuery("#gradeDetail").jqGrid('setGridParam',{url:"procurementGrade_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
								showPopup(json.msg,json.title);
								jQuery('.ui-jqdialog-titlebar-close').click();
                            }
		   		
                            
                            
                        },
                        
                 
                        
                        afterSave: function (id, response, options) {
                            var json = JSON.parse(response.responseText);
							jQuery("#gradeDetail").jqGrid('setGridParam',{url:"procurementGrade_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
							showPopup(json.msg,json.title);
							jQuery('.ui-jqdialog-titlebar-close').click();
                        }
                        
                        
                           
                       
                    }
		    	 }
		   			 ],
		   	height: 301, 
		    width: jQuery("#baseDiv").width(), // assign parent div width
		    scrollOffset: 0,
		   	rowNum:10,
		   	rowList : [10,25,50],
		    sortname:'id',			  
		    sortorder: "desc",
		    viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
		   /*  onSelectRow: function(id){ 
			  document.detailform.id.value  =id;
		      document.detailform.submit();      
			},		 */
	        onSortCol: function (index, idxcol, sortorder) {
		        if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
	                    && this.p.colModel[this.p.lastsort].sortable !== false) {
	                $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
	            }
	        },
	        
	        loadComplete: function() {
	        	$('#gradeDetail').setColProp('procurementProductId', { editoptions: { value: loadCrop} });
	      		$('#gradeDetail').setColProp('procurementVarietyId', { editoptions: { value: loadVariety} });
	      		$('#gradeDetail').setColProp('selectedUnit', { editoptions: { value: loadUnit} });
	       		$(".ui-inline-save span").removeClass("glyphicon").removeClass("glyphicon-save");
	       		$(".ui-inline-save span").addClass("fa").addClass("fa-save").addClass("inline-gridSave");
	       		$(".ui-inline-cancel span").removeClass("glyphicon").removeClass("glyphicon-remove-circle");
	       		$(".ui-inline-cancel span").addClass("fa").addClass("fa-close").addClass("inline-gridSave");
					//$(".ui-inline-save span").html('<i class="fa fa-floppy-o fa-4 inline-gridSave" aria-hidden="true"></i>');
	       		
	        }
		});
		
		jQuery("#gradeDetail").jqGrid('navGrid','#pagerForDetailGrade',{edit:false,add:false,del:false,search:false,refresh:true}); // enabled refresh for reloading grid
		jQuery("#gradeDetail").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false}); // enabling filters on top of the header.

		colModel = jQuery("#gradeDetail").jqGrid('getGridParam', 'colModel');
	    $('#gbox_' + $.jgrid.jqID(jQuery("#gradeDetail")[0].id) +
	        ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
	        var cmi = colModel[i], colName = cmi.name;

	        if (cmi.sortable !== false) {
	            $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
	        } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
	            $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
	        }
	    });
	
}

function resetData()
{
	// $('#selectedCrop').prop('selectedIndex',-1);
	// $('#selectedCrop').val('');
	$("#cropName").val('');
	$("#unit").val('-1');
	$("#cropCat").val('');
	$("#varietyName").val('');
	$("#crop").val();
	$("#noDaysToGrow").val('');
	$("#varietyYield").val('');
	$("#harvestDays").val('');
	document.getElementById("validateErrorCrop").innerHTML='';
	document.getElementById("validateErrorVariety").innerHTML='';
	
}

function addCropCategory()     
{
	var crop=$("#cropName").val();
	var unit=$("#unit").val();
	//var cropCategory =$('input:radio[name="cropCategory"]:checked').val();
	var cropCategory=$("#cropCat").val();
	
	if(crop=="" || crop==null)
	{
		document.getElementById("validateErrorCrop").innerHTML='<s:text name="empty.name"/>';
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	else if(unit=="-1" || unit==null)
	{
		document.getElementById("validateErrorCrop").innerHTML='<s:text name="empty.unit"/>';
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	
	else if(cropCategory=="-1" || cropCategory==null)
	{
		document.getElementById("validateErrorCrop").innerHTML='<s:text name="empty.category"/>';
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	else
	{
		$.post("procurementProductEnroll_create",{cropName:crop,unit:unit,cropCategory:cropCategory},function(result){
			resetData("cropForm");
			jQuery("#detail").jqGrid('setGridParam',{url:"procurementProductEnroll_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
			var validateMsg=JSON.parse(result);
			showPopup(validateMsg.msg,validateMsg.title);
			jQuery.post("procurementVariety_populateCrop.action",function(result){
				insertOptions("selectedCrop",JSON.parse(result));
				insertOptions("procurementProductId",JSON.parse(result));
			});
			
			
		});
		document.getElementById("validateErrorCrop").innerHTML='';
	}
}


function addCrop()     
{
	var crop=$("#cropName").val();
	var unit=$("#unit").val();
	var mspRate=$("#mspRate").val();
	var mspPercentage=$("#mspPercentage").val();
	if(crop=="" || crop==null)
	{
		document.getElementById("validateErrorCrop").innerHTML='<s:text name="empty.name"/>';
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	else if(unit=="-1" || unit==null)
	{
		document.getElementById("validateErrorCrop").innerHTML='<s:text name="empty.unit"/>';
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	
	else if(tenant=="chetna" && mspRate=="" )
	{
		
		document.getElementById("validateErrorCrop").innerHTML='<s:text name="empty.mspRate"/>';
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	
	else if(tenant=='chetna' && mspPercentage=="" )
	{
		document.getElementById("validateErrorCrop").innerHTML='<s:text name="empty.mspPerctage"/>';
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	
	else
	{
		$.post("procurementProductEnroll_create",{cropName:crop,unit:unit,mspRate:mspRate,mspPercentage:mspPercentage},function(result){

			resetData("cropForm");
			jQuery("#detail").jqGrid('setGridParam',{url:"procurementProductEnroll_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
			showPopup(result.msg,result.title);
			 /* var validateMsg=JSON.parse(result);
			showPopup(validateMsg.msg,validateMsg.title); */
			
			
			jQuery.post("procurementVariety_populateCrop.action",function(result){
				insertOptions("selectedCrop",JSON.parse(result));
				insertOptions("procurementProductId",JSON.parse(result));
			});
			
			
		});
		document.getElementById("validateErrorCrop").innerHTML='';
	}
	
	
}


function addVariety()
{
	var variety=$("#varietyName").val();
	var selectedCrop=$("#selectedCrop").val();
	var noDaysToGrow=$("#noDaysToGrow").val();
	var varietyYield=$("#varietyYield").val();
	var harvestDays=$("#harvestDays").val();
	if(!selectedCrop.trim()|| selectedCrop==null)
	{
		document.getElementById("validateErrorVariety").innerHTML='<s:text name="empty.crop"/>';
	}
	else if(variety=="" || variety==null)
	{
		document.getElementById("validateErrorVariety").innerHTML='<s:text name="empty.name"/>';
	}
	
	else if(tenant=='kpf'||tenant=='wub' && varietyYield=="" )
	{
		document.getElementById("validateErrorVariety").innerHTML='<s:text name="empty.yield"/>';
		
	}
	else if(tenant=='kpf'||tenant=='wub'  && noDaysToGrow=="" )
	{
		document.getElementById("validateErrorVariety").innerHTML='<s:text name="empty.noDaysToGrow"/>';
	}
	else if((tenant!='pratibha') && (tenant!='olivado') && (tenant!='welspun') && (harvestDays=="" || harvestDays==null) && (tenant!='livelihood'))
	{
		document.getElementById("validateErrorVariety").innerHTML='<s:text name="empty.harvestDays"/>';
	}
	else
	{
		$.post("procurementVariety_create",{procurementProductId:selectedCrop,varietyName:variety,noDaysToGrow:noDaysToGrow,varietyYield:varietyYield,harvestDays:harvestDays},function(result){
			resetData("varietyForm");
			jQuery("#vareityDetail").jqGrid('setGridParam',{url:"procurementVariety_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
			//var validateMsg=JSON.parse(result);
			
			
		
			var variety = $.ajax({url: 'procurementGrade_populateProcurementVariety.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Countries.');}}).responseText;
			 loadVariety=variety.replace("{","").replace("}","");
			
			var crop = $.ajax({url: 'procurementVariety_populateProcurementProduct.action', async: false, success: function(data, result) {if (!result) alert('Failure to retrieve the Countries.');}}).responseText;
			 loadCrop=crop.replace("{","").replace("}","");
			
			/* showPopup(validateMsg.msg,validateMsg.title); */
			 showPopup(result.msg,result.title);
			
	});
		document.getElementById("validateErrorVariety").innerHTML='';
	}
	
}



function addGrade()
{
	
	var selectedCrop=$("#procurementProductId").val();
	var selectedVariety=$("#selectedVariety").val();
	var gradeName=$("#gradeName").val();
	var unit=$("#unit").val();
	var gradePrice=$("#gradePrice").val();
	//$('#procurementProductId').val(null).trigger('change');
	//$('#selectedVariety').val(null).trigger('change');
	//$('#gradeName').val(null);
	$('#unit').val(null);
	$('#gradePrice').val(null);
	
	if(selectedCrop=="" || selectedCrop==null)
	{
		
		document.getElementById("validateErrorGrade").innerHTML='<s:text name="empty.crop"/>';
	}
	
	 else if(selectedVariety=="" || selectedVariety==null || isEmpty(selectedVariety))
	{
		 document.getElementById("validateErrorGrade").innerHTML='<s:property value="%{getLocaleProperty('empty.variety')}" />';
	}
	
	else if(gradeName=="" || gradeName==null)
	{
		document.getElementById("validateErrorGrade").innerHTML='<s:text name="empty.name"/>';
	}
	/*else if(unit=="" || unit==null)
	{
		document.getElementById("validateErrorGrade").innerHTML='<s:text name="empty.unit"/>';
	}*/
	else if(gradePrice=="" || gradePrice==null)
	{
		document.getElementById("validateErrorGrade").innerHTML='<s:text name="empty.price"/>';
	}
	
	else
	{
		$.post("procurementGrade_create",{gradeName:gradeName,procurementVarietyId:selectedVariety,selectedUnit:unit,gradePrice:gradePrice},function(result){
			resetData("gradeForm");
			jQuery("#gradeDetail").jqGrid('setGridParam',{url:"procurementGrade_data.action?",page:1,mtype: 'POST'}).trigger('reloadGrid');
			showPopup(result.msg,result.title);
			var validateMsg=JSON.parse(result);
			alert("validateMsg:"+validateMsg);
			
			//showPopup(validateMsg.msg,validateMsg.title);
			//resetData("gradeForm");
			
		});
		document.getElementById("validateErrorGrade").innerHTML='';
		loadCropGrid();
		loadVarietyGrid();
		loadGradeGrid();
	}
	
}

function populateVariety(obj)
{
	jQuery.post("procurementGrade_populateVariety.action",{id:obj.value,dt:new Date(),procurementProductId:obj.value},function(result){
		insertOptions("selectedVariety",JSON.parse(result));
	});
	
}

function populateVarietyEdit(val,id)
{
	jQuery.post("procurementGrade_populateVariety.action",{id:val,dt:new Date(),procurementProductId:val},function(result){
		insertOptions(id,JSON.parse(result));
		//listGramPanchayat(document.getElementById("vcities"));
	});
	
	


}
function resetData(id){
	$("#"+id)[0].reset();
	$("#"+id).trigger("reset");
	$('.select2').trigger("change");
	 $('.select2').select2();
}

		 
function getAjaxValue(url,dataa,selRow,idSuffix){
	var resp = $.ajax({
		url: url,
		data:dataa,
		type: 'post',
		async: false, 
		success: function(data, result) {
			if (!result) 
				alert('Failure to load data');
			}
	}).responseText;
	
		var id="#"+selRow+idSuffix;
		var selectedValue = jQuery(id).val();
		insertJQOptions(selRow+idSuffix,JSON.parse(resp));
		jQuery(id).val(selectedValue);
		
		
}		 

function insertJQOptions(ctrlName, jsonArr) {
	document.getElementById(ctrlName).length = 0;
	/* addOption(document.getElementById(ctrlName), "Select", ""); */
	for (var i = 0; i < jsonArr.length; i++) {
		addOption(document.getElementById(ctrlName), jsonArr[i].name,
				jsonArr[i].id);
	}
	
}

$("#variety").click(function() {
	  alert( "Handler for .click() called." );
	});
		 
</script>

	<!-- Nav tabs -->
				<ul class="nav nav-pills nav-justified" role="tablist">
					<li class="nav-item waves-effect waves-light" style="padding:10px;"><a
			class="nav-link active  border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#crop-tabs">
				<span class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> 
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
								d="M5,3 L6,3 C6.55228475,3 7,3.44771525 7,4 L7,20 C7,20.5522847 6.55228475,21 6,21 L5,21 C4.44771525,21 4,20.5522847 4,20 L4,4 C4,3.44771525 4.44771525,3 5,3 Z M10,3 L11,3 C11.5522847,3 12,3.44771525 12,4 L12,20 C12,20.5522847 11.5522847,21 11,21 L10,21 C9.44771525,21 9,20.5522847 9,20 L9,4 C9,3.44771525 9.44771525,3 10,3 Z"
								fill="#000000"></path>
																			<rect fill="#000000" opacity="0.3"
								transform="translate(17.825568, 11.945519) rotate(-19.000000) translate(-17.825568, -11.945519)"
								x="16.3255682" y="2.94551858" width="3" height="18" rx="1"></rect>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bold text-center">Crop Details</span>
		</a></li>
					<li class="nav-item waves-effect waves-light" style="padding:10px;"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#variety-tabs">
				<span class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo3/dist/assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<rect fill="#000000" x="4" y="4" width="7" height="7"
								rx="1.5"></rect>
																			<path
								d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z"
								fill="#000000" opacity="0.3"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">Variety Details</span>
		</a></li>
					<li class="nav-item waves-effect waves-light" style="padding:10px;"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#grade-tabs">
				<span class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo3/dist/assets/media/svg/icons/Media/Movie-Lane2.svg-->
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
								d="M6,3 L18,3 C19.1045695,3 20,3.8954305 20,5 L20,19 C20,20.1045695 19.1045695,21 18,21 L6,21 C4.8954305,21 4,20.1045695 4,19 L4,5 C4,3.8954305 4.8954305,3 6,3 Z M5.5,5 C5.22385763,5 5,5.22385763 5,5.5 L5,6.5 C5,6.77614237 5.22385763,7 5.5,7 L6.5,7 C6.77614237,7 7,6.77614237 7,6.5 L7,5.5 C7,5.22385763 6.77614237,5 6.5,5 L5.5,5 Z M17.5,5 C17.2238576,5 17,5.22385763 17,5.5 L17,6.5 C17,6.77614237 17.2238576,7 17.5,7 L18.5,7 C18.7761424,7 19,6.77614237 19,6.5 L19,5.5 C19,5.22385763 18.7761424,5 18.5,5 L17.5,5 Z M5.5,9 C5.22385763,9 5,9.22385763 5,9.5 L5,10.5 C5,10.7761424 5.22385763,11 5.5,11 L6.5,11 C6.77614237,11 7,10.7761424 7,10.5 L7,9.5 C7,9.22385763 6.77614237,9 6.5,9 L5.5,9 Z M17.5,9 C17.2238576,9 17,9.22385763 17,9.5 L17,10.5 C17,10.7761424 17.2238576,11 17.5,11 L18.5,11 C18.7761424,11 19,10.7761424 19,10.5 L19,9.5 C19,9.22385763 18.7761424,9 18.5,9 L17.5,9 Z M5.5,13 C5.22385763,13 5,13.2238576 5,13.5 L5,14.5 C5,14.7761424 5.22385763,15 5.5,15 L6.5,15 C6.77614237,15 7,14.7761424 7,14.5 L7,13.5 C7,13.2238576 6.77614237,13 6.5,13 L5.5,13 Z M17.5,13 C17.2238576,13 17,13.2238576 17,13.5 L17,14.5 C17,14.7761424 17.2238576,15 17.5,15 L18.5,15 C18.7761424,15 19,14.7761424 19,14.5 L19,13.5 C19,13.2238576 18.7761424,13 18.5,13 L17.5,13 Z M17.5,17 C17.2238576,17 17,17.2238576 17,17.5 L17,18.5 C17,18.7761424 17.2238576,19 17.5,19 L18.5,19 C18.7761424,19 19,18.7761424 19,18.5 L19,17.5 C19,17.2238576 18.7761424,17 18.5,17 L17.5,17 Z M5.5,17 C5.22385763,17 5,17.2238576 5,17.5 L5,18.5 C5,18.7761424 5.22385763,19 5.5,19 L6.5,19 C6.77614237,19 7,18.7761424 7,18.5 L7,17.5 C7,17.2238576 6.77614237,17 6.5,17 L5.5,17 Z"
								fill="#000000" opacity="0.3"></path>
																			<path
								d="M11.3521577,14.5722612 L13.9568442,12.7918113 C14.1848159,12.6359797 14.2432972,12.3248456 14.0874656,12.0968739 C14.0526941,12.0460053 14.0088196,12.002002 13.9580532,11.9670814 L11.3533667,10.1754041 C11.1258528,10.0189048 10.8145486,10.0764735 10.6580493,10.3039875 C10.6007019,10.3873574 10.5699997,10.4861652 10.5699997,10.5873545 L10.5699997,14.1594818 C10.5699997,14.4356241 10.7938573,14.6594818 11.0699997,14.6594818 C11.1706891,14.6594818 11.2690327,14.6290818 11.3521577,14.5722612 Z"
								fill="#000000"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">Grade Details</span>
		</a></li>
					
				</ul>
				
	<div class="tab-content p-3 text-muted">
	<div class="tab-pane active" id="crop-tabs" role="tabpanel">
					<s:form name="cropForm" id="cropForm">
		
				<div>
		
			<sec:authorize ifAllGranted="profile.procurementProduct.create">
			<button type="BUTTON" id="add" class="btn btn-success mb-2 float-right" >Add Crop <i class="ri-menu-add-line align-middle ml-2"></i></button>
			</sec:authorize>

</div>
			<div id="cropAccordian" class="panel-collapse collapse">
			
				
					<div class="ferror" id="validateErrorCrop" class=" hide alert alert-danger"></div>
					
					<div class="row">
				
					<div class="col-md-4">
							<div class="form-group name">
								<label for="txt"><s:text name="product.name" /><sup
								style="color: red;">*</sup>
								</label>
								<div class="">
								<s:textfield name="cropName" maxlength="35" id="cropName"  cssClass="form-control"/>
								</div>
							</div>
						</div>
					<div class="col-md-4">
							<div class="form-group name">
								<label for="txt"><s:text name="product.unit" /><sup
								style="color: red;">*</sup>
								</label>
								<div class="">
									<s:select id="unit" name="procurementProduct.types.code"
									list="listUom" headerKey="-1" listKey="code" listValue="name"
									headerValue="%{getText('txt.select')}"
									cssClass="form-control" />
								</div>
							</div>
						</div>

							
						

				
				</div>
				<div class="row">
				<div class="crop-custom-button-items">
								<button type="button" class="btn btn-success waves-effect waves-light" data-toggle="modal"
									onclick="addCrop()">
									<s:text name="save.button" />
									
								</button>
							</div>
				</div>
			</div>
		</s:form>
		<div id="cropBaseDiv">
				 <div class="responsiveDiv table table-striped table-hover mt-3"  id="baseDiv">
			<table class="table table-centered datatable dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;" id="detail"></table>
			<div id="pagerForDetail"></div>
		</div>	
		</div>		
					</div>
					
					
					
					
	</div>
				