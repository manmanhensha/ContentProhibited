package com.bootdo.reserve_functions.stram_test;

import java.util.Objects;

/**
 * @author wushiqiang
 * @date Created in 16:15 2020/4/28
 * @description
 * @modified By
 */

public class Student {

	private long id;
	private String name;
	private int age;
	private String address;

	public Student(long id, String name, int age, String address) {
		this.id = id;
		this.name = name;
		this.age = age;
		this.address = address;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof Student)) return false;
		Student student = (Student) o;
		return getId() == student.getId() &&
				getAge() == student.getAge() &&
				getName().equals(student.getName()) &&
				getAddress().equals(student.getAddress());
	}

	@Override
	public int hashCode() {
		return Objects.hash(getId(), getName(), getAge(), getAddress());
	}
}
