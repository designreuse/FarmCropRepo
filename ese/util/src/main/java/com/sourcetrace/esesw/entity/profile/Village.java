/*
 * Village.java
 * Copyright (c) 2014-2015, SourceTrace Systems, All Rights Reserved.
 *
 * This software is the confidential and proprietary information of SourceTrace Systems
 * ("Confidential Information"). You shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement you entered into with
 * SourceTrace Systems.
 */
package com.sourcetrace.esesw.entity.profile;

import java.util.List;

import com.sourcetrace.eses.util.StringUtil;

public class Village {

	private long id;
	private String name;
	private String code;
	private Municipality city;
	private GramPanchayat gramPanchayat;
	private long revisionNo;
	private String branchId;
	private String seq;
	
	private String countryName;
	/**
	 * Transient variable
	 */
	private List<String> branchesList;

	/**
	 * Gets the id.
	 * 
	 * @return the id
	 */
	public long getId() {

		return id;
	}

	/**
	 * Sets the id.
	 * 
	 * @param id
	 *            the new id
	 */
	public void setId(long id) {

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
	 * Gets the code.
	 * 
	 * @return the code
	 */
	public String getCode() {

		return code;
	}

	/**
	 * Sets the code.
	 * 
	 * @param code
	 *            the new code
	 */
	public void setCode(String code) {

		this.code = code;
	}

	// @NotNull(message = "empty.city")
	/**
	 * Gets the city.
	 * 
	 * @return the city
	 */
	public Municipality getCity() {

		return city;
	}

	/**
	 * Sets the city.
	 * 
	 * @param city
	 *            the new city
	 */
	public void setCity(Municipality city) {

		this.city = city;
	}

	/**
	 * Gets the gram panchayat.
	 * 
	 * @return the gram panchayat
	 */
	public GramPanchayat getGramPanchayat() {

		return gramPanchayat;
	}

	/**
	 * Sets the gram panchayat.
	 * 
	 * @param gramPanchayat
	 *            the new gram panchayat
	 */
	public void setGramPanchayat(GramPanchayat gramPanchayat) {

		this.gramPanchayat = gramPanchayat;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {

		return name;
	}

	/**
	 * Gets the village name.
	 * 
	 * @return the village name
	 */
	public String getVillageName() {

		StringBuffer villageName = new StringBuffer();
		if (!StringUtil.isEmpty(code)) {
			villageName.append(code);
			villageName.append(" - ");
		}
		if (!StringUtil.isEmpty(name)) {
			villageName.append(name);
		}
		return villageName.toString();
	}

	/**
	 * Sets the revision no.
	 * 
	 * @param revisionNo
	 *            the new revision no
	 */
	public void setRevisionNo(long revisionNo) {

		this.revisionNo = revisionNo;
	}

	/**
	 * Gets the revision no.
	 * 
	 * @return the revision no
	 */
	public long getRevisionNo() {

		return revisionNo;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public List<String> getBranchesList() {
		return branchesList;
	}

	public void setBranchesList(List<String> branchesList) {
		this.branchesList = branchesList;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}


}
