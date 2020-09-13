/*
 * FarmerValidator.java
 * Copyright (c) 2014-2015, SourceTrace Systems, All Rights Reserved.
 *
 * This software is the confidential and proprietary information of SourceTrace Systems
 * ("Confidential Information"). You shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement you entered into with
 * SourceTrace Systems.
 */
package com.ese.view.profile.validator;

import java.lang.reflect.Type;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.hibernate.validator.ClassValidator;
import org.hibernate.validator.InvalidValue;
import org.springframework.beans.factory.annotation.Autowired;

import com.ese.entity.DynamicData;
import com.ese.entity.util.ESESystem;
import com.ese.view.validator.IValidator;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sourcetrace.eses.dao.ICertificationDAO;
import com.sourcetrace.eses.dao.IClientDAO;
import com.sourcetrace.eses.dao.IFarmerDAO;
import com.sourcetrace.eses.filter.ISecurityFilter;
import com.sourcetrace.eses.service.IFarmerService;
import com.sourcetrace.eses.service.IPreferencesService;
import com.sourcetrace.eses.util.ObjectUtil;
import com.sourcetrace.eses.util.ReflectUtil;
import com.sourcetrace.eses.util.StringUtil;
import com.sourcetrace.eses.util.ValidationUtil;
import com.sourcetrace.esesw.entity.profile.Farmer;
import com.sourcetrace.esesw.entity.profile.FarmerDynamicFieldsValue;

/**
 * The Class FarmerValidator.
 */
public class FarmerValidator implements IValidator {
	private static final Logger logger = Logger.getLogger(FarmerValidator.class);
	private IFarmerDAO farmerDAO;
	private ICertificationDAO certificationDAO;
	private IClientDAO clientDAO;
	@Autowired
	private IPreferencesService preferncesService;
	@Autowired
	private IFarmerService farmerService;

	/**
	 * @see com.ese.view.validator.IValidator#validate(java.lang.Object)
	 */
	public Map<String, String> validate(Object object) {

		ClassValidator farmerValidator = new ClassValidator(Farmer.class);
		Farmer aFarmer = (Farmer) object;
		HttpServletRequest httpRequest=ReflectUtil.getCurrentHttpRequest();
        String branchId_F=(String) httpRequest.getSession().getAttribute(ISecurityFilter.CURRENT_BRANCH);
        String tenantId = (String) httpRequest.getSession().getAttribute(ISecurityFilter.TENANT_ID);
        tenantId = StringUtil.isEmpty(tenantId) ? ISecurityFilter.DEFAULT_TENANT_ID : tenantId;

		Map<String, String> errorCodes = new LinkedHashMap<String, String>();
		if (logger.isInfoEnabled()) {
			logger.info("validate(Object) " + aFarmer.toString());
		}

		InvalidValue[] values = null;

		
		
		/*
		 * else { errorCodes.put("farmer.farmerCode.empty",
		 * "farmer.farmerCode.empty"); }
		 */
	
			if (!StringUtil.isEmpty(aFarmer.getFarmerCode())) {
				if (!ValidationUtil.isPatternMaches(aFarmer.getFarmerCode(), ValidationUtil.ALPHANUMERIC_PATTERN)) {
					errorCodes.put("pattern.farmerCode", "pattern.farmerCode");
				}
			}
	
		
		
			if (!StringUtil.isEmpty(aFarmer.getFirstName())) {
				
				if (!ValidationUtil.isPatternMaches(aFarmer.getFirstName(), ValidationUtil.ALPHANUMERIC_PATTERN)) {
					errorCodes.put("pattern.farmerFirstName", "pattern.farmerFirstName");
				}
			
			}else {
		 if(!StringUtil.isEmpty(tenantId)&& !tenantId.equalsIgnoreCase(ESESystem.OLIVADO_TENANT_ID)&& !tenantId.equalsIgnoreCase(ESESystem.LIVELIHOOD_TENANT_ID)){
			
			 errorCodes.put("empty.farmerName", "empty.farmerName");
			
		 }
		}
		
			
		if (!StringUtil.isEmpty(aFarmer.getLastName())) {
			if(!StringUtil.isEmpty(tenantId)&& !tenantId.equalsIgnoreCase(ESESystem.WILMAR_TENANT_ID)){
			if (!ValidationUtil.isPatternMaches(aFarmer.getLastName(), ValidationUtil.ALPHANUMERIC_PATTERN)) {
				errorCodes.put("pattern.farmerLastName", "pattern.farmerLastName");
			}
			}
		}

		/*
		 * if (!StringUtil.isEmpty(aFarmer.getDateOfBirth())) { if
		 * (!ValidationUtil.isPatternMaches(aFarmer.getDateOfBirth().toString(),
		 * ValidationUtil.ALPHANUMERIC_PATTERN)) {
		 * errorCodes.put("pattern.dateOfBirth", "pattern.dateOfBirth"); } }
		 */

		if (!StringUtil.isEmpty(aFarmer.getNoOfFamilyMembers())) {
			if (!ValidationUtil.isPatternMaches(String.valueOf(aFarmer.getNoOfFamilyMembers()),
					ValidationUtil.NUMBER_PATTERN)) {
				errorCodes.put("pattern.noOfFamilyMembers", "pattern.noOfFamilyMembers");
			}
		} else {
			errorCodes.put("farmer.noOfFamilyMembers.empty", "farmer.noOfFamilyMembers.empty");
		}

		 if(!StringUtil.isEmpty(tenantId)&&tenantId.equalsIgnoreCase("welspun")|| tenantId.equalsIgnoreCase("olivado")){
		 if (StringUtil.isEmpty(aFarmer.getAddress())) {
		 errorCodes.put("pattern.address.empty", "pattern.address.empty"); }
		 }
		if(!StringUtil.isEmpty(tenantId)&&tenantId.equalsIgnoreCase("efk")){ 
		if (StringUtil.isEmpty(aFarmer.getVillage())) {
			errorCodes.put("empty.village", "empty.village.name");
		}
		}
		
		else {
			if (!tenantId.equalsIgnoreCase("livelihood")) {

				if (StringUtil.isEmpty(aFarmer.getVillage())) {
					errorCodes.put("empty.village", "empty.village");
				}
			}
		}
		
		if (StringUtil.isEmpty(aFarmer.getSamithi())) {
		    if(branchId_F!=null && branchId_F.equals("bci") && 
		    		!StringUtil.isEmpty(tenantId)&& tenantId.equalsIgnoreCase("pratibha") ){
			errorCodes.put("empty.samathi", "empty.samithi.bci");
			} else {
				if (!tenantId.equalsIgnoreCase("livelihood")) {
					errorCodes.put("empty.samathi", "empty.samithi");
				}
			}
		}
		
		ESESystem preferencess = preferncesService.findPrefernceById("1");
		if(!StringUtil.isEmpty(preferencess)){
			String getCurrentTenant = (preferencess.getPreferences().get(ESESystem.MAIN_BRANCH_NAME));
			 if (!getCurrentTenant.equalsIgnoreCase("pratibha") && !getCurrentTenant.equalsIgnoreCase("welspun") && !getCurrentTenant.equalsIgnoreCase("sticky") && !getCurrentTenant.equalsIgnoreCase("symrise") && !tenantId.equalsIgnoreCase("livelihood")){
				 if (Farmer.CERTIFIED_YES == aFarmer.getIsCertifiedFarmer()) {
						if (aFarmer.getCertificationType() < 0)
							errorCodes.put("certificationType.empty", "certificationType.empty");

					}
			  }
			
		}
		
			

		if (!StringUtil.isEmpty(aFarmer.getPhoneNumber())) {
			if (!ValidationUtil.isPatternMaches(aFarmer.getPhoneNumber(), ValidationUtil.NUMBER_PATTERN)) {
				errorCodes.put("pattern.phoneNumber", "pattern.phoneNumber");
			}
		}else if (tenantId.equalsIgnoreCase(ESESystem.FARM_AGG) && branchId_F!=null && branchId_F.equals("Individual")){
			 
				 errorCodes.put("empty.mobileInv", "empty.mobileInv");
			 }
		
		
		
		/*if (!StringUtil.isEmpty(aFarmer.getMobileNumber())) {
			if (aFarmer.getMobileNumber().length() != 10) {
				errorCodes.put("pattern.mobileNumber", "pattern.mobileNumber");
			}
		}*/
		
		/*
		 * if (!StringUtil.isEmpty(aFarmer.getMobileNumber())) { if
		 * (aFarmer.getAdhaarNo().length()<10) {
		 * errorCodes.put("pattern.mobileNumber", "pattern.mobileNumber"); } }
		 */

		if(!tenantId.equalsIgnoreCase(ESESystem.LIVELIHOOD_TENANT_ID)){
		if (!StringUtil.isEmpty(aFarmer.getEmail())) {
			if (!ValidationUtil.isPatternMaches(aFarmer.getEmail(), ValidationUtil.EMAIL_PATTERN)) {
				errorCodes.put("pattern.email", "pattern.email");
			}
		}else if(branchId_F!=null && branchId_F.equals("Corporate")){
			 errorCodes.put("empty.email", "empty.email");
		 }
		}

		/*
		 * if (StringUtil.isEmpty(aFarmer.getLongitude()))
		 * errorCodes.put("emptyLongitude", "empty.longitude");
		 * 
		 * 
		 * 
		 * 
		 * if (StringUtil.isEmpty(aFarmer.getLatitude()))
		 * errorCodes.put("emptyLatitude", "empty.latitude");
		 */
		ESESystem preferenceses = preferncesService.findPrefernceById("1");
	
	
	

		/*
		 * if (aFarmer.getLoanTakenLastYear()==1) {
		 * 
		 * if (StringUtil.isEmpty(aFarmer.getLoanAmount())) {
		 * errorCodes.put("empty.loanAmount", "empty.loanAmount"); } }
		 */
		ESESystem preferences = preferncesService.findPrefernceById("1");
		String isFpoEnabled = "";
		if(!tenantId.equalsIgnoreCase("sahaja") && !tenantId.equalsIgnoreCase(ESESystem.OLIVADO_TENANT_ID) && !tenantId.equalsIgnoreCase(ESESystem.GRIFFITH_TENANT_ID)){
		if (!StringUtil.isEmpty(preferences)) {
			isFpoEnabled = (preferences.getPreferences().get(ESESystem.ENABLE_FPOFG));
			if ((isFpoEnabled.trim().equals("1"))) {
				if (StringUtil.isEmpty(aFarmer.getFpo())) {
					errorCodes.put("farmer.fpo", "empty.fpoGroup");
				}
			}
		}
		}
		if(aFarmer.getVehicle()!=null )
		{
		if(aFarmer.getVehicle().equalsIgnoreCase("99")){
			if(StringUtil.isEmpty(aFarmer.getVehicleOther())){
				errorCodes.put("empty.vehicleOther", "empty.vehicleOther");
			}
		}
		}
		
    if(aFarmer.getFarmerEconomy()!=null){
		if(aFarmer.getFarmerEconomy().getHousingOwnership()==99){
			if(StringUtil.isEmpty(aFarmer.getFarmerEconomy().getHousingOwnershipOther())){
				errorCodes.put("empty.housingOwnershipOther", "empty.housingOwnershipOther");
			}
		}
	}
		
	if(aFarmer.getFarmerEconomy()!=null){		
		if(aFarmer.getFarmerEconomy().getHousingType()!=null)
		{
		if(aFarmer.getFarmerEconomy().getHousingType().equalsIgnoreCase("99")){
			if(StringUtil.isEmpty(aFarmer.getFarmerEconomy().getOtherHousingType())){
				errorCodes.put("empty.housingTypeOther", "empty.housingTypeOther");
			}
		}
		}}
		
	if(aFarmer.getFarmerEconomy()!=null){
		if(aFarmer.getFarmerEconomy().getDrinkingWaterSource()!=null)
		{
		if(aFarmer.getFarmerEconomy().getDrinkingWaterSource().equalsIgnoreCase("99")){
			if(StringUtil.isEmpty(aFarmer.getFarmerEconomy().getDrinkingWaterSourceOther())){
				errorCodes.put("empty.drinkingWaterOther", "empty.drinkingWaterOther");
			}
		}
		}}
	
		
	
	
	if(aFarmer.getValidateDynamicFields()!=null && aFarmer.getValidateDynamicFields().length()>0){

		
		Type listType1 = new TypeToken<List<DynamicData>>() {
		}.getType();
		List<DynamicData> dynamicList = new Gson().fromJson(aFarmer.getValidateDynamicFields(), listType1);
		for(DynamicData dynamicData:dynamicList)
		{
			if(dynamicData.getIsRequired().equalsIgnoreCase("1") && StringUtil.isEmpty(dynamicData.getValue()))
			{
				errorCodes.put(dynamicData.getName(), "Please Enter "+dynamicData.getName());
			}
			
		}
		
		
		
	}
	

		return errorCodes;
	}

	

	/**
	 * Sets the farmer dao.
	 * 
	 * @param farmerDAO
	 *            the new farmer dao
	 */
	public void setFarmerDAO(IFarmerDAO farmerDAO) {

		this.farmerDAO = farmerDAO;
	}

	/**
	 * Gets the farmer dao.
	 * 
	 * @return the farmer dao
	 */
	public IFarmerDAO getFarmerDAO() {

		return farmerDAO;
	}

	/**
	 * Sets the certification dao.
	 * 
	 * @param certificationDAO
	 *            the new certification dao
	 */
	public void setCertificationDAO(ICertificationDAO certificationDAO) {

		this.certificationDAO = certificationDAO;
	}

	/**
	 * Sets the client dao.
	 * 
	 * @param clientDAO
	 *            the new client dao
	 */
	public void setClientDAO(IClientDAO clientDAO) {

		this.clientDAO = clientDAO;
	}

	/**
	 * Gets the client dao.
	 * 
	 * @return the client dao
	 */
	public IClientDAO getClientDAO() {

		return clientDAO;
	}

}
