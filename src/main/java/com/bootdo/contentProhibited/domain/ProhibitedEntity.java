package com.bootdo.contentProhibited.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@Table(name = "b_prohibited")
public class ProhibitedEntity {
	@Id
	@Column(name = "prohibited_id")
	private String prohibitedId;

	/**
	 * 违禁词
	 */
	private String code;

	@Column(name = "created_time")
	private Date createdTime;

	@Column(name = "created_by")
	private String createdBy;

	@Column(name = "updated_time")
	private Date updatedTime;

	@Column(name = "updated_by")
	private String updatedBy;

}