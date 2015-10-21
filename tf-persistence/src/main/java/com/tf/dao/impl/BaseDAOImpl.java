package com.tf.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.BaseDAO;


@Repository
@Transactional
public abstract  class BaseDAOImpl<T, ID extends Serializable> implements BaseDAO<T, ID>  {
	
	protected static final Log _log = LogFactory.getLog(BaseDAOImpl.class);

	
	 @Autowired
	 public SessionFactory sessionFactory;
	 
	 private Class<T> persistentClass;  
	 
	
	 
	 public BaseDAOImpl(Class<T> persistentClass) {
	        this.persistentClass = persistentClass;
	  }

	 
	 public BaseDAOImpl() {
	        Type t = getClass().getGenericSuperclass();
	        ParameterizedType pt = (ParameterizedType) t;
	        persistentClass = (Class) pt.getActualTypeArguments()[0];
	    }


	public T findById(Serializable id) {
		 T entity; 
		entity = (T) sessionFactory.getCurrentSession().get(getPersistentClass(), id); 
		return entity;  
	}
	
	public Class<T> getPersistentClass() {  
        return persistentClass;  
    }  


}