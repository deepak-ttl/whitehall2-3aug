package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.CompanyDAO;
import com.tf.dao.UserDAO;
import com.tf.model.Company;
import com.tf.persistance.util.InvestorDTO;
import com.tf.service.CompanyService;


@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDAO companyDAO;
	
	@Autowired
	private UserDAO userDAO;

	@Transactional
	public List<Company> getCompaniesByStatus(String status,int startIndex,int pageSize) {
		return companyDAO.getCompaniesByStatus(status, startIndex, pageSize);
	}
	
	@Transactional
	public List<Company> getCompaniesByStatusFilter(String status,int startIndex,int pageSize,String searchvalue) {
		return companyDAO.getCompaniesByStatusFilter(status, startIndex, pageSize,searchvalue);
	}

	public List<Company> getCompaniesByStatus(String status,long userID){
		long companyId=userDAO.getCompanyIDbyUserID(userID);
		return companyDAO.getCompaniesByStatus(status,companyId);	
	}
	
	public void addCompany(Company company) {
		 companyDAO.addCompany(company);		
	}

	public Company findById(long id) {
		// TODO Auto-generated method stub
		return companyDAO.findById(id);
	}
	
	public String  getCompanyTypebyID(long id)	{
	return companyDAO.getCompanyTypebyID(id);
}

	public Company registerCompany(Company company) {
		// TODO Auto-generated method stub
		return companyDAO.registerCompany(company);
	}
	
	public List<Long> deleteCompany(Long id){
		 return companyDAO.deleteCompany(id);
	}
	
	public List<Company> getCompanies(String companyType){
		return companyDAO.getCompanies(companyType);		
	}
	
	public Long getCompaniesCount(String status) {
		return companyDAO.getCompaniesCount(status);	
	}
	
	public Company  loadCompanyId(long id){
		return companyDAO.loadCompanyId(id);
	}
	
	public List<Company> getCompaniesById(Long id){
		return companyDAO.getCompaniesById(id);
	}

	public Company loadById(long id) {
		 return companyDAO.loadById(id);
	}
	
	public List<InvestorDTO> getInvestors(){
		return companyDAO.getInvestors();
	}
	public Company getCompaniesByRegNum(String RegNum){
		return companyDAO.getCompaniesByRegNum(RegNum);
	}
	
	public Company getCompaniesByName(String name){
		return companyDAO.getCompaniesByName(name);
	}

	public long validateCompanyName(Company cmp) {		
		return  companyDAO.validateCompanyName(cmp);
	}

	public long validateCompanyRegNo(Company cmp) {
		return companyDAO.validateCompanyRegNo(cmp);
	}

	public List<Company> getSellerCompanies(String companyType) {
		return  companyDAO.getSellerCompanies(companyType);
	}
	
	
	
	public List<Company> getSellerCompaniesUsingJoinForAdmin() {
		return  companyDAO.getSellerCompaniesUsingJoinForAdmin();
	}
	
	
	public List<Company> getSellerCompaniesUsingJoin(String companyType,long companyId) {
		  return  companyDAO.getSellerCompaniesUsingJoin(companyType,companyId);
		 }
	
	
	public List<Company> getCompaniesByStatus(String status){
	    return  companyDAO.getCompaniesByStatus(status);
	}
	
	public Long getCompaniesCountByStatus(String status) {
		return companyDAO.getCompaniesCountByStatus(status);	
	}

	public List<Company> getCompaniesBySortingParam(int startIndex,
			int pageSize, String columnName, String order, String status,String searchValue) {
		return companyDAO.getCompaniesBySortingParam(startIndex, pageSize, columnName, order, status,searchValue);
	}
}
