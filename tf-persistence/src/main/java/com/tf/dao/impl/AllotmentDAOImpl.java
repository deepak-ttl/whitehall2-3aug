package com.tf.dao.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.AllotmentDAO;
import com.tf.model.Allotment;

@Repository
@Transactional
public class AllotmentDAOImpl extends BaseDAOImpl<Allotment, Long>   implements AllotmentDAO {
	
	@SuppressWarnings("unchecked")
	public List<Allotment> getALlotmentsbyTrade(long tradeID){
		List<Allotment>  allotmentList=new ArrayList<Allotment>();
		Allotment allotment;
		List<Object[]> rows=new ArrayList<Object[]>();
		
		_log.debug("Inside getALlotmentsbyTrade ");
		try {
			
			Criteria cr = sessionFactory.getCurrentSession().createCriteria(Allotment.class).add(Restrictions.eq("scfTrade.id", tradeID));
			              
			ProjectionList prList = Projections.projectionList();
			prList.add(Projections.groupProperty("marketDiscount"));
			prList.add(Projections.sum("allotmentAmount"));
			prList.add(Projections.sum("whitehallProfitShare"));
			prList.add(Projections.sum("investorNetProfit"));
			prList.add(Projections.property("allotmentDate"));
			cr.setProjection(prList);
			rows = cr.list();
			for(Object[] row:rows){
				allotment=new Allotment();
				allotment.setMarketDiscount(Integer.valueOf(row[0].toString()));
				allotment.setAllotmentAmount(new BigDecimal (row[1].toString()));
				allotment.setWhitehallProfitShare(new BigDecimal(row[2].toString()) );
				allotment.setInvestorNetProfit(new BigDecimal (row[3].toString()));
				allotmentList.add(allotment);
			}
			_log.debug("getALlotmentsbyTrade successful, result size: "
					+ allotmentList.size());
			
		} catch (RuntimeException re) {
			_log.error("getALlotmentsbyTrade failed", re);
			throw re;
		}
		return allotmentList;
		
	}

	public List<Allotment> groupAllotmentbyBps() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
