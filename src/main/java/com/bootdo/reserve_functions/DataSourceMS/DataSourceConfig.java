package com.bootdo.reserve_functions.DataSourceMS;

/**
 * @author wushiqiang
 * @date Created in 10:40 2021/1/4
 * @description
 * @modified By
 */

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.activation.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * 主从配置
 *
 * @author wyq
 */
@Configuration
@MapperScan(basePackages = "com.wyq.mysqlreadwriteseparate.mapper", sqlSessionTemplateRef = "sqlTemplate")
public class DataSourceConfig {

	/**
	 * 主库
	 */
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.master")
	public DruidDataSource master() {
		return DruidDataSourceBuilder.create().build();
	}

	/**
	 * 从库
	 */
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.slave")
	public DruidDataSource slaver() {
		return DruidDataSourceBuilder.create().build();
	}


	/**
	 * 实例化数据源路由
	 */
	@Bean
	public DataSourceRouter dynamicDB(@Qualifier("master") DataSource masterDataSource,
									  @Autowired(required = false) @Qualifier("slaver") DataSource slaveDataSource
	) {
		DataSourceRouter dynamicDataSource = new DataSourceRouter();
		Map<Object, Object> targetDataSources = new HashMap<>();
		targetDataSources.put(DataSourceEnum.MASTER.getDataSourceName(), masterDataSource);
		if (slaveDataSource != null) {
			targetDataSources.put(DataSourceEnum.SLAVE.getDataSourceName(), slaveDataSource);
		}
		dynamicDataSource.setTargetDataSources(targetDataSources);
		dynamicDataSource.setDefaultTargetDataSource(masterDataSource);
		return dynamicDataSource;
	}


	/**
	 * 配置sessionFactory
	 *
	 * @param dynamicDataSource
	 * @return
	 * @throws Exception
	 */
	@Bean
	public SqlSessionFactory sessionFactory(
			@Qualifier("dynamicDB") DataSource dynamicDataSource
	) throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setMapperLocations(
				new PathMatchingResourcePatternResolver().getResources("classpath*:mapper/*Mapper.xml"));
		bean.setDataSource((javax.sql.DataSource) dynamicDataSource);
		return bean.getObject();
	}


	/**
	 * 创建sqlTemplate
	 *
	 * @param sqlSessionFactory
	 * @return
	 */
	@Bean
	public SqlSessionTemplate sqlTemplate(
			@Qualifier("sessionFactory") SqlSessionFactory sqlSessionFactory
	) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}


	/**
	 * 事务配置
	 *
	 * @param dynamicDataSource
	 * @return
	 */
	@Bean(name = "dataSourceTx")
	public DataSourceTransactionManager dataSourceTransactionManager(
			@Qualifier("dynamicDB") DataSource dynamicDataSource
	) {
		DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
		dataSourceTransactionManager.setDataSource((javax.sql.DataSource) dynamicDataSource);
		return dataSourceTransactionManager;
	}
}
