package com.bootdo.reserve_functions.lottyutil;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_card")
public class CardEntity {
	/**
	 * id
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	/**
	 * 卡片code
	 */
	@Column(name = "card_code")
	private String cardCode;

	/**
	 * 图片地址
	 */
	@Column(name = "card_url")
	private String cardUrl;

	/**
	 * 卡片分类code
	 */
	@Column(name = "category_code")
	private String categoryCode;

	/**
	 * 图片权重
	 */
	private Double weight;

	/**
	 * 创建时间
	 */
	@Column(name = "created_time")
	private Date createdTime;

	/**
	 * 更新时间
	 */
	@Column(name = "update_time")
	private Date updateTime;

	/**
	 * 获取id
	 *
	 * @return id - id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * 设置id
	 *
	 * @param id id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 获取卡片code
	 *
	 * @return card_code - 卡片code
	 */
	public String getCardCode() {
		return cardCode;
	}

	/**
	 * 设置卡片code
	 *
	 * @param cardCode 卡片code
	 */
	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}

	/**
	 * 获取图片地址
	 *
	 * @return card_url - 图片地址
	 */
	public String getCardUrl() {
		return cardUrl;
	}

	/**
	 * 设置图片地址
	 *
	 * @param cardUrl 图片地址
	 */
	public void setCardUrl(String cardUrl) {
		this.cardUrl = cardUrl;
	}

	/**
	 * 获取卡片分类code
	 *
	 * @return category_code - 卡片分类code
	 */
	public String getCategoryCode() {
		return categoryCode;
	}

	/**
	 * 设置卡片分类code
	 *
	 * @param categoryCode 卡片分类code
	 */
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	/**
	 * 获取图片权重
	 *
	 * @return weight - 图片权重
	 */
	public Double getWeight() {
		return weight;
	}

	/**
	 * 设置图片权重
	 *
	 * @param weight 图片权重
	 */
	public void setWeight(Double weight) {
		this.weight = weight;
	}

	/**
	 * 获取创建时间
	 *
	 * @return created_time - 创建时间
	 */
	public Date getCreatedTime() {
		return createdTime;
	}

	/**
	 * 设置创建时间
	 *
	 * @param createdTime 创建时间
	 */
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	/**
	 * 获取更新时间
	 *
	 * @return update_time - 更新时间
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * 设置更新时间
	 *
	 * @param updateTime 更新时间
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}