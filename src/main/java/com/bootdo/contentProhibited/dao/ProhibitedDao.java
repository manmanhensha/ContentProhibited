package com.bootdo.contentProhibited.dao;


import com.bootdo.contentProhibited.domain.ProhibitedEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface ProhibitedDao extends CommunityDao<ProhibitedEntity> {
}