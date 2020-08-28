/**
 * ESESystem.java
 * Copyright (c) 2008-2009, Source Trace Systems
 * ALL RIGHTS RESERVED
 */
package com.ese.entity.util;

import java.util.Map;
import java.util.Set;

/**
 * ESESystem is a global scope entity. It holds the system preference settings.
 * 
 * @author $Author: moorthy $
 * @version $Rev: 1312 $, $Date: 2010-07-05 11:25:52 +0530 (Mon, 05 Jul 2010) $
 */
public class ESESystem {

	public static final String SYSTEM_ESE_NAME = "ESE";
	public static final String SYSTEM_ESE = "1";
	public static final String SYSTEM_SWITCH = "2";
	public static final String SYSTEM_SWITCH_MONEYGRAM = "3";
	public static final String SYSTEM_SWITCH_MONEYGRAM_VALIDATION = "4";

	public static final String USER_NAME = "USER_NAME";
	public static final String PASSWORD = "PASSWORD";
	public static final String MAIL_HOST = "MAIL_HOST";
	public static final String PORT = "PORT";
	public static final String AGENT_EXPIRY_TIMER = "AGENT_EXPIRY_TIMER";

	public static final String CLIENT = "2";
	public static final String CLIENT_NAME = "CLIENT_NAME";
	public static final String CLIENT_MAC = "CLIENT_MAC";

	public static final String DONT_ACCESS_DATA_FILTER = "DONT_ACCESS_DATA_FILTER";
	
	public static final String YES="1";
	public static final String NO="0";

	/** ESE AGENT CRED PROPERTIES **/
	public static final String ESE_MFI = "2";
	public static final String FP_OVERRIDE_PER_CUSTOMER = "FP_OVERRIDE_PER_CUSTOMER";
	public static final String FP_OVERRIDE_PER_OPERATOR = "FP_OVERRIDE_PER_OPERATOR";
	public static final String CASH_IN_HAND = "CASH_IN_HAND";
	public static final String CASH_IN_HAND_PERMITTED = "CASH_IN_HAND_PERMITTED";
	public static final String ONLINE_DEPOSIT_LIMIT_MIN = "ONLINE_DEPOSIT_LIMIT_MIN";
	public static final String ONLINE_DEPOSIT_LIMIT_MAX = "ONLINE_DEPOSIT_LIMIT_MAX";
	public static final String ONLINE_WITHDRAW_LIMIT_MIN = "ONLINE_WITHDRAW_LIMIT_MIN";
	public static final String ONLINE_WITHDRAW_LIMIT_MAX = "ONLINE_WITHDRAW_LIMIT_MAX";
	public static final String OFFLINE_DEPOSIT_LIMIT_MIN = "OFFLINE_DEPOSIT_LIMIT_MIN";
	public static final String OFFLINE_DEPOSIT_LIMIT_MAX = "OFFLINE_DEPOSIT_LIMIT_MAX";
	public static final String OFFLINE_WITHDRAW_LIMIT_MIN = "OFFLINE_WITHDRAW_LIMIT_MIN";
	public static final String OFFLINE_WITHDRAW_LIMIT_MAX = "OFFLINE_WITHDRAW_LIMIT_MAX";
	public static final String HOUR_BEFORE_SYNC = "HOUR_BEFORE_SYNC";
	public static final String TXN_BETWEEN_SYNC = "TXN_BETWEEN_SYNC";
	public static final String TURNOVER_BETWEEN_SYNC = "TURNOVER_BETWEEN_SYNC";
	public static final String ONLINE_DEPOSIT_LIMIT_PER_SYNC = "ONLINE_DEPOSIT_LIMIT_PER_SYNC";
	public static final String ONLINE_WITHDRAW_LIMIT_PER_SYNC = "ONLINE_WITHDRAW_LIMIT_PER_SYNC";
	public static final String OFFLINE_DEPOSIT_LIMIT_PER_SYNC = "OFFLINE_DEPOSIT_LIMIT_PER_SYNC";
	public static final String OFFLINE_WITHDRAW_LIMIT_PER_SYNC = "OFFLINE_WITHDRAW_LIMIT_PER_SYNC";
	public static final String CUSTOMER_TXN_PER_DAY_LIMIT = "CUSTOMER_TXN_PER_DAY_LIMIT";

	public static final String SESS_TOUT = "SESS_TOUT";
	public static final String GE_KEY = "GE_KEY";
	public static final String CURRENCY = "CURRENCY";
	public static final String AGENT_MIN_BAL = "AGENT_MIN_BAL";
	public static final String CLIENT_MIN_BAL = "CLIENT_MIN_BAL";
	public static final String AGENT_MIN_BAL_OTHER = "AGENT_MIN_BAL_OTHER";
	public static final String CLIENT_MIN_BAL_OTHER = "CLIENT_MIN_BAL_OTHER";

	public static final String VALIDMCC1 = "VALIDMCC1";
	public static final String VALIDMCC2 = "VALIDMCC2";
	public static final String VALIDMCC3 = "VALIDMCC3";
	public static final String TXNPERDAY = "TXNPERDAY";
	public static final String AMOUNTPERDAY1 = "AMOUNTPERDAY1";
	public static final String AMOUNTPERTXN1 = "AMOUNTPERTXN1";
	public static final String AMOUNTPERDAY2 = "AMOUNTPERDAY2";
	public static final String AMOUNTPERTXN2 = "AMOUNTPERTXN2";
	public static final String MAX_PIN_RETRY = "MAX_PIN_RETRY";

	// Agent and client commission fee calculation for base static variables
	public static final String AHO = "AHO";
	public static final String CTE = "CTE";
	public static final String PRE = "PRE";
	public static final String TP = "TPE";
	public static final String DOLLAR = "DOL";
	public static final String CORDOBA = "COR";

	// offline account limits
	public static final String ACCTTYPE = "ACCTTYPE";
	public static final String OFFLIMIT = "OFFLIMIT";
	public static final String OFFLIMIT2 = "OFFLIMIT2";

	// offline txn constraints
	public static final String TXNTYPE = "TXNTYPE";
	public static final String MAXPERSYNCH = "MAXPERSYNCH";
	public static final String MAXREVPERDAY = "MAXREVPERDAY";
	public static final String MAXPERDAY = "MAXPERDAY";
	public static final String MAXPERDAY2 = "MAXPERDAY2";

	public static final String COMMISSION_FREQUENCY = "COMMISSION_FREQUENCY";
	public static final String COMMISSION_START_DATE = "COMMISSION_START_DATE";

	public static final String COMMISSION_NEXT_START_DATE = "COMMISSION_NEXT_START_DATE";
	public static final String COMMISSION_FREQUENCY_COUNT = "COMMISSION_FREQUENCY_COUNT";
	public static final String COMMISSION_CURRENT_STATE = "COMMISSION_CURRENT_STATE";
	public static final String COMMISSION_PAYMENT_PROCESS = "COMMISSION_PAYMENT_PROCESS";
	public static final int DAY = 1;
	public static final int WEEK = 2;
	public static final int MONTH = 3;
	public static final String INVALID_ATTEMPTS_COUNT = "NO_OF_INVALID_LOGIN_ATTEMPTS";
	public static final String TIME_TO_AUTO_RELEASE = "TIME_TO_AUTO_RELEASE";

	public static final String DAILY_CLOSIGN_TIME = "DAILY_CLOSIGN_TIME";
	public static final String MCC_WILDCARD_IDENTIFIER = "MCC_WILDCARD_IDENTIFIER";
	public static final String ES_VERSION = "ES_VERSION";
	public static final String ES_UPGRADE_VERSION = "ES_UPGRADE_VERSION";
	public static final String DATE_FORMAT = "ESE_DATE_FORMAT";
	public static final String DATE_TIME_FORMAT = "ESE_DATE_TIME_FORMAT";
	public static final String ENABLE_COMMISSION = "ENABLE_COMMISSION";

	public static final String MDB_INVALID_ATTEMPTS_COUNT = "MDB_NO_OF_INVALID_LOGIN_ATTEMPTS";
	public static final String MDB_TIME_TO_AUTO_RELEASE = "MDB_TIME_TO_AUTO_RELEASE";

	// MONEY GRAM
	public static final String MONEY_GRAM_AGENT_ID = "MONEY_GRAM_AGENT_ID";
	public static final String MONEY_GRAM_AGENT_SEQUENCE = "MONEY_GRAM_AGENT_SEQUENCE";
	public static final String MONEY_GRAM_API_VERSION = "MONEY_GRAM_API_VERSION";
	public static final String MONEY_GRAM_CLIENT_SOFTWARE_VERSION = "MONEY_GRAM_CLIENT_SOFTWARE_VERSION";
	public static final String MONEY_GRAM_LANGUAGE = "MONEY_GRAM_LANGUAGE";
	public static final String MONEY_GRAM_TOKEN = "MONEY_GRAM_TOKEN";
	public static final String THEME = "THEME";
	public static final String SESSION_THEME_ATTRIBUTE_NAME = "esetheme";
	public static final String LOCATION_HISTORY_THRESHOLD_VALUE = "LOC_HISTORY_THRESHOLD_VALUE";
	public static final String TARE_WEIGHT = "TARE_WEIGHT";
	public static final String CURRENT_SEASON_CODE = "CURRENT_SEASON_CODE";
	

	// Rate of Interest
	public static final String INTEREST_MODULE = "INTEREST_MODULE";
	public static final String RATE_OF_INTEREST = "RATE_OF_INTEREST";
	public static final String ROI_EFFECTIVE_FROM = "ROI_EFFECTIVE_FROM";
	public static final String ROI_EFFECT_EXISTING_FARMER = "ROI_EFFECT_EXISTING_FARMER";
	public static final String DAILY_INTEREST_CALC_TYPE = "DAILY_INTEREST_CALC_TYPE";
	public static final String NO_OF_DAYS_PER_YEAR = "NO_OF_DAYS_PER_YEAR";
	public static final String IS_QR_CODE_SEARCH_REQUIRED = "IS_QR_CODE_SEARCH_REQUIRED";

	// Remote Configuration
	public static final String REMOTE_APK_VERSION = "REMOTE_APK_VERSION";
	public static final String REMOTE_CONFIG_VERSION = "REMOTE_CONFIG_VERSION";
	public static final String REMOTE_DB_VERSION = "REMOTE_DB_VERSION";

	public static final String AREA_CAPTURE_MODE = "AREA_CAPTURE_MODE";
	public static final String GEO_FENCING_FLAG = "GEO_FENCING_FLAG";
	public static final String GEO_FENCING_RADIUS_MT = "GEO_FENCING_RADIUS_MT";

	// SMS Alert Related Configuration
	public static final String SMS_ALTERS = "SMS_ALTERS";
	public static final String SMS_GATEWAY_URL = "SMS_GATEWAY_URL";
	public static final String SMS_BULK_GATEWAY_URL = "SMS_BULK_GATEWAY_URL";
	public static final String SMS_STATUS_URL = "SMS_STATUS_URL";
	public static final String SMS_TOKEN = "SMS_TOKEN";
	public static final String SMS_SENDER_ID = "SMS_SENDER_ID";
	public static final String SMS_ROUTE = "SMS_ROUTE";
	public static final String SMS_UNICODE = "SMS_UNICODE";
	public static final String SMS_FLASH = "SMS_FLASH";
	 public static final String SMS_USER_NAME= "SMS_USER_NAME";
	 public static final String SMS_TEMPLATE="SMS_TEMPLATE";
	 public static final String SMS_TEST_STATUS="SMS_TEST_STATUS";
	 public static final String SMS_MESSAGE="SMS_MESSAGE";
	 public static final String SMS_MESSAGE_PAYMENT="SMS_MESSAGE_PAYMENT";
	 public static final String SMS_API_KEY="SMS_API_KEY";
	 public static final String SMS_CLIENT_ID="SMS_CLIENT_ID";
	

	public static final String COMPANY_NAMES = "COMPANY_NAMES";
	public static final String OTHERS = "Others";
	public static final String OTHER = "Other";

	// Generic configurations
	public static final String ENABLE_BRANCH = "ENABLE_BRANCH";
	public static final String TENANT_ID = "TENANT_ID";
	public static final String ENABLE_MULTI_PRODUCT = "ENABLE_MULTI_PRODUCT";
	public static final String MAIN_BRANCH_NAME = "MAIN_BRANCH_NAME";
	public static final String ENABLE_GRAMPANJAYAT = "ENABLE_GRAMPANJAYAT";
	public static final String FARMER_MAX_RANGE = "FARMER_MAX_RANGE";
	public static final String ENABLE_WAREHOUSEDOWNLOAD_SEASON = "ENABLE_WAREHOUSEDOWNLOAD_SEASON";
	public static  final String  SCHEDULER_URL="SCHEDULER_URL";

	private int id;
	private String name;
	private Map<String, String> preferences;
	
	public static final String FARMER_ID_LENGTH = "FARMER_ID_LENGTH";
	public static final String ENABLE_FARMER_CODE = "ENABLE_FARMER_CODE";
	public static final String CODE_TYPE = "CODE_TYPE";
	public static final String ENABLE_SUPPLIER = "ENABLE_SUPPLIER";
	public static final String ENABLE_BANK_INFO = "ENABLE_BANK_INFO";
	public static final String ENABLE_ICSNAME = "ENABLE_ICSNAME";
	public static final String SOIL_TESTING = "SOIL_TESTING";
	public static final String CHETNA_TENANT_ID = "chetna";
	public static final String EXPORT_RECORD_LIMIT = "EXPORT_RECORD_LIMIT";
	public static final String CANDA_TENANT_ID = "canda";
	public static final String IS_SINGLE_TENANT = "IS_SINGLE_TENANT";
	public static final String SINGLE_TENANT_NAME = "SINGLE_TENANT_ID";
	public static final String ENABLE_INSURANCE_INFO = "ENABLE_INSURANCE_INFO";
	public static final String ENABLE_CROP_INFO = "ENABLE_CROP_INFO";
	public static final String ENABLE_ICS_NAME = "ENABLE_ICS_NAME";
	public static final String ENABLE_INCOME_DETAIL = "ENABLE_INCOME_DETAIL";
	public static final String ENABLE_FARM_REGISTER_NO = "ENABLE_FARM_REGISTER_NO";
	public static final String ENABLE_CONVENTIONAL_INFORMATION = "ENABLE_CONVENTIONAL_INFORMATION";
	public static final String ENABLE_HARVEST_SEASON_INFO = "ENABLE_HARVEST_SEASON_INFO";

	public static final String WAREHOUSE_STOCK_CHART = "WAREHOUSE_STOCK_CHART";
	public static final String FARMERS_BY_GROUP_PIE = "FARMERS_BY_GROUP_PIE";
	public static final String FARMERS_BY_GROUP_BAR = "FARMERS_BY_GROUP_BAR";
	public static final String DEVICE_CHART = "DEVICE_CHART";
	public static final String FARMERS_BY_ORG = "FARMERS_BY_ORG";
	public static final String TOTAL_LAND_ACRE_CHART = "TOTAL_LAND_ACRE_CHART";
	public static final String TOTAL_AREA_PRODUCTION_CHART = "TOTAL_AREA_PRODUCTION_CHART";
	public static final String SEED_TYPE_CHART = "SEED_TYPE_CHART";
	public static final String SEED_SOURCE_CHART = "SEED_SOURCE_CHART";
	public static final String FARMER_DETAILS_CHART = "FARMER_DETAILS_CHART";
	public static final String CROP_DETAILS_CHART = "CROP_DETAILS_CHART";
	public static final String PROCUREMENT_DETAILS_BAR_CHART="PROCUREMENT_DETAILS_BAR_CHART";
	public static final String FARMER_SOWING_HARVEST="FARMER_SOWING_HARVEST_BAR_CHART";
	public static final String AREA_UNDER_PRODUCTION_BY_ORG="AREA_UNDER_PRODUCTION_BY_ORG_CHARTS";
	public static final String GINNER_QUANTITY_SOLD_CHARTS="GINNER_QUANTITY_SOLD_CHARTS";
	public static final String GMO_CHARTS="GMO_CHARTS";
	public static final String ENABLE_CROP_FILTER = "ENABLE_CROP_FILTER";
	public static final String ENABLE_PRODUCTION_AREA = "ENABLE_PRODUCTION_AREA";
	public static final String ENABLE_YIELD = "ENABLE_YIELD";
	
	
	/**TENANTS*/
	public static final String LALTEER_TENANT_ID = "lalteer";
	public static final String AWI_TENANT_ID = "awi";
	public static final String ENABLE_APPROVED = "ENABLE_APPROVED";
	public static final String IS_MULTI_BRANCH_APP = "IS_MULTI_BRANCH_APP";
	public static final String COW_MILK_MONTH_CHART = "COW_MILK_MONTH_CHART";
	public static final String COW_MILK_NON_MILK_CHART = "COW_MILK_NON_MILK_CHART";
	public static final String COW_BY_VILLAGE_CHART = "COW_BY_VILLAGE_CHART";
	public static final String COW_BY_RESEARCH_STATION_CHART = "COW_BY_RESEARCH_STATION_CHART";
	public static final String COW_DISEASE_CHART = "COW_DISEASE_CHART";
	public static final String TXN_CHART = "TXN_CHART";
	public static final String COW_COST_BAR_CHART = "COW_COST_BAR_CHART";
	public static final String TOTAL_LAND_ACRE_BY_VILLAGE_CHART = "TOTAL_LAND_ACRE_BY_VILLAGE_CHART";
	public static final String PRATIBHA_TENANT_ID = "pratibha";
	public static final String WELSPUN_TENANT_ID = "welspun";
	public static final String PRATIBHA_ORGANIC_BRANCH_ID = "organic";
	public static final String PRATIBHA_BCI_BRANCH_ID = "bci";
	public static final String GENERAL_DATE_FORMAT = "GENERAL_DATE_FORMAT";
	public static final String INDEV_TENENT = "indev";
	public static final String ENABLE_BATCH_NO = "ENABLE_BATCH_NO";
	public static final String BLRI_TENANT_ID = "blri";
	public static final String KPF_TENANT_ID = "kpf";
	public static final String AGRO_TENANT = "agro";
	public static final String FINCOCOA_TENANT_ID = "fincocoa";
	public static final String MOVCD_TENANT_ID = "movcd";
	public static final String CRSDEMO_TENANT_ID = "crsdemo";
	public static final String PGSS_TENANT_ID = "pgss";
	public static final String WILMAR_TENANT_ID = "wilmar";
	public static final String NSWITCH_TENANT_ID = "nswitch";
	public static final String CABI_TENANT_ID = "cabi";
	public static final String OLIVADO_TENANT_ID = "olivado";
	public static final String GRIFFITH_TENANT_ID="griffith";
	public static final String COFBOARD_TENANT_ID="cofBoard";
	public static final String SIMFED_TENANT_ID = "simfed";
	public static final String FRUITMASTER_TENANT_ID = "fruitmaster";
	public static final String IFFCO_TENANT_ID = "iffco";
	public static final String WUB_TENANT_ID = "wub";
	public static final String STICKY_TENANT_ID = "sticky";
	public static final String SYMRISE = "symrise";
	public static final String GSMA_TENANT_ID="gsma";
	public static final String OCP = "ocp";
	public static final String SUSAGRI = "susagri";
	public static final String AVT = "avt";
	public static final String FARM_AGG = "farmAgg";
	public static final String KENYA_FPO = "kenyafpo";

		/** FARMER VARIABLES */
	public static final String ENROLLMENT_PLACE_DATE = "ENROLLMENT_PLACE_DATE";
	public static final String IS_CERTIFIED_FARMER = "IS_CERTIFIED_FARMER";
	public static final String ID_PROOF = "ID_PROOF";
	public static final String FARMER_ADDRESS_MANDATORY="FARMER_ADDRESS_MANDATORY";
	public static final String LOCATION_INFO="LOCATION_INFO";
	public static final String GROUP="GROUP";
	public static final String ENABLE_FPOFG = "ENABLE_FPOFG";
	public static final String FARMER_FAMILY_INFO="FARMER_FAMILY_INFO";
	public static final String ASSET_OWNERSHIP="ASSET_OWNERSHIP";
	public static final String DWELLING_PLACE="DWELLING_PLACE";
	public static final String FARMER_MOBILE_MANDATORY = "FARMER_MOBILE_MANDATORY";
	public static final String FARMER_ICS_FIELDS="FARMER_ICS_FIELDS";
	
	public static final String CURRENT_THEME = "CURRENT_THEME";
	public static final String ENABLE_TRACEABILITY="ENABLE_TRACEABILITY";
	public static final String FARMER_COC_CHART = "FARMER_COC_CHART";
	public static final String FARMER_DATA_STAT_CHART = "FARMER_DATA_STAT_CHART";
	public static final String FARMER_ICS_CHART = "FARMER_ICS_CHART";	
	public static final String CROP_HARVEST_SALE = "CROP_HARVEST_SALE";	
	public static final String COC_DONUGHT_CHART = "COC_DONUGHT_CHART";
	public static final String COC_SEGREGATE_CHART ="COC_SEGREGATE_CHART";
	public static final String ENABLE_BUYER="ENABLE_BUYER";
	public static final String INDIA_CURRENCY="(INR)";
	public static final String AREA_ACRE="(Acres)";
	public static final String PRODUCT_COTTON="Cotton";
	public static final String PRODUCT_CROP="Crop";
	public static final String CURRENCY_TYPE = "CURRENCY_TYPE";
	public static final String AREA_TYPE = "AREA_TYPE";
	public static final String IS_ACCURACY_VALUE="IS_ACCURACY_VALUE";
	public static final String TXN_TYPES_MOBILE_ACTIVITY="TXN_TYPES_MOBILE_ACTIVITY";
	public static final String LABEL_NAMES = "LABEL_NAMES";
	public static final String DATA_TYPES = "DATA_TYPES";
	public static final String CURRENCY_SYMPOL_EXPORT="@*";
	public static final String QR_CODE_TEXT = "QR_CODE_TEXT";
	public static final String AREA_TYPE_EXPORT="%#";
	public static final String DOLLAR_CURRENCY="$";
	public static final String HECTARE="Ha";
	
	public static final String ENABLE_FINGER_PRINT = "ENABLE_FINGER_PRINT";
	
	public static final String WEATHER_FORECAST_URL="WEATHER_FORECAST_URL";
	
	public static final String SOIL_MOISTURE_URL="SOIL_MOISTURE_URL";

	public static final String FORECAST_URL="FORECAST_URL";

	public static final String IS_KPF_BASED= "IS_KPF_BASED";
	
	public static final String DISABLE_BRANCH= "DISABLE_BRANCH";
	
	/** QR CODE ADDRESS */
	public static final String ADDRESS_LINE1="ADDRESS_LINE1";
	public static final String ADDRESS_LINE2="ADDRESS_LINE2";
	public static final String ADDRESS_LINE3="ADDRESS_LINE3";
	public static final String ADDRESS_LINE4="ADDRESS_LINE4";
	public static final String ADDRESS_LINE5="ADDRESS_LINE5";
	public static final String ADDRESS_LINE6="ADDRESS_LINE6";
	public static final String ADDRESS_LINE7="ADDRESS_LINE7";
	public static final String ADDRESS_LINE8="ADDRESS_LINE8";
	public static final String ADDRESS_LINE9="ADDRESS_LINE9";
	public static final String ADDRESS_LINE10="ADDRESS_LINE10";
	public static final String ADDRESS_LINE11="ADDRESS_LINE11";
	public static final String ADDRESS_LINE12="ADDRESS_LINE12";
	public static final String ADDRESS_LINE13="ADDRESS_LINE13";
	public static final String ADDRESS_LINE14="ADDRESS_LINE14";
	public static final String ADDRESS_LINE15="ADDRESS_LINE15";
	public static final String ADDRESS_LINE16="ADDRESS_LINE16";
	public static final String ADDRESS_LINE17="ADDRESS_LINE17";
	public static final String BARCODE="BARCODE";
	
	public static final String FTP_URL="FTP_URL";
	public static final String FTP_PASSWORD="FTP_PASSWORD";
	public static final String FTP_USERNAME="FTP_USERNAME";
	public static final String FTP_VIDEO_PATH="FTP_VIDEO_PATH";
	public static final String IS_FIELDSTAFF_TRACKING = "IS_FST_ENABLED";
	public static final String DEFAULT_LATITUDE="DEFAULT_LATITUDE";
	public static final String DEFAULT_LONGTITUDE="DEFAULT_LONGTITUDE";
	public static final String PLOTTING_TYPE_MAP="PLOTTING_TYPE_MAP";

	/** QUESTIONS */
	public static final String MAXIMUM_SUB_FORM_QUESTIONS="MAXIMUM_SUB_FORM_QUESTIONS";
	
	// HEAP CODE FOR TRACEABILITY
	public static final String HEAP_CODE="HEAP_CODE";
	
	
	//DISTRIBUTION IMAGE
	public static final String ENABLE_DISTRIBUTION_IMAGE = "ENABLE_DISTRIBUTION_IMAGE";
	//PRODUCT RETURN IMAGE
	public static final String ENABLE_PRODUCT_RETURN_IMAGE = "ENABLE_PRODUCT_RETURN_IMAGE";
	
	public static final String ENABLE_DIGITAL_SIGNATURE = "ENABLE_DIGITAL_SIGNATURE";
	
	public static final String ENABLE_STORAGE = "ENABLE_STORAGE";
	
	public static final String NO_OF_CRATES = "NO_OF_CRATES";
	
	public static final String ENABLE_CROP_CALENDAR = "ENABLE_CROP_CALENDAR";
	
	public static final String contracte_template = "contracte_template";
	public static final String contracte_template_farmer_detail = "contracte_template_farmer_detail";
	
	public static final String WEB_URL="WEB_URL";
	public static final String APK_URL="APK_URL";
	public static final String CC_EMAIL="CC_EMAIL";
	
	
	public static final String SELECTED_DYN_FIELDS_WHILE_FARM_DOWNLOAD = "SELECTED_DYN_FIELDS_WHILE_FARM_DOWNLOAD";
	
	/*AWI MTN PAYMENT*/
	public static final String MTN_SUB_PRIMARY_KEY="MTN_SUB_PRIMARY_KEY";
	public static final String MTN_SUB_SECONDARY_KEY="MTN_SUB_SECONDARY_KEY";
	public static final String MTN_API_USER="MTN_API_USER";
	public static final String MTN_API_KEY="MTN_API_KEY";
	public static final String MTN_POST_TOKEN_URL="MTN_POST_TOKEN_URL";
	public static final String MTN_GET_ACC_BAL_URL="MTN_GET_ACC_BAL_URL";
	public static final String MTN_POST_TRANSFER_URL="MTN_POST_TRANSFER_URL";
	public static final String MTN_GET_TRANSFER_STATUS_URL="MTN_GET_TRANSFER_STATUS_URL";
	public static final String MTN_GET_ACC_HOLDER_STATUS_URL="MTN_GET_ACC_HOLDER_STATUS_URL";
	public static final String LIVELIHOOD_TENANT_ID = "livelihood";
	
	/*US SMS GATEWAY*/
	public static final String US_SMS_URL = "US_SMS_URL";
	public static final String US_SMS_API_SECRET = "US_SMS_API_SECRET";
    public static final String US_SMS_API_KEY = "US_SMS_API_KEY";
    public static final String US_SMS_FROM = "US_SMS_FROM";
	
    public static final String PDF_WIDTH = "PDF_WIDTH";
	public static final String PDF_HEIGHT = "PDF_HEIGHT";
	

	
	/*Loan Module*/
	public static final String ENABLE_LOAN_MODULE="ENABLE_LOAN_MODULE";
	private Set<LoanInterest> loanInterestDetails;
	

	public static final String ENABLE_SMS_IN_PROCUREMENT_MODULE = "ENABLE_SMS_IN_PROCUREMENT_MODULE";

	

	/**
	 * Gets the id.
	 * 
	 * @return the id
	 */
	public int getId() {

		return id;
	}

	/**
	 * Sets the id.
	 * 
	 * @param id
	 *            the new id
	 */
	public void setId(int id) {

		this.id = id;
	}

	/**
	 * Gets the name.
	 * 
	 * @return the name
	 */
	public String getName() {

		return name;
	}

	/**
	 * Sets the name.
	 * 
	 * @param name
	 *            the new name
	 */
	public void setName(String name) {

		this.name = name;
	}

	/**
	 * Gets the preferences.
	 * 
	 * @return the preferences
	 */
	public Map<String, String> getPreferences() {

		return preferences;
	}

	/**
	 * Sets the preferences.
	 * 
	 * @param preferences
	 *            the preferences
	 */
	public void setPreferences(Map<String, String> preferences) {

		this.preferences = preferences;
	}

	public static String getHectare() {
		return HECTARE;
	}

	public Set<LoanInterest> getLoanInterestDetails() {
		return loanInterestDetails;
	}

	public void setLoanInterestDetails(Set<LoanInterest> loanInterestDetails) {
		this.loanInterestDetails = loanInterestDetails;
	}

	
	
	

}