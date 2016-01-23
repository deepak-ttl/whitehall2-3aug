package com.tf.controller.settings;

import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletRequest;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.ParamUtil;
import com.tf.dto.InvestorModel;
import com.tf.model.SellerSetting;
import com.tf.persistance.util.InvestorDTO;
import com.tf.service.InvestorService;
import com.tf.service.SettingService;

/**
 * This controller is responsible for request/response handling on
 * Whitehall settings screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class WhiteHallSettingController {
	
	private static final String INVESTOR 					= "investor";
	private static final String GENERAL_SETTINGS 			= "generalsetting";
	private static final String SELLER 						= "seller";
	private static final String SCF_COMPANY 				= "scfCompany";
	private  final static String ACTIVETAB			 		="activetab";	
	protected Log _log 										= LogFactoryUtil.getLog(WhiteHallSettingController.class);
	
	@Autowired
	private InvestorService investorService;
	
	@Autowired
	private SettingService settingService;
	

	
	
	@RenderMapping(params = "render=generalsetting")
	protected ModelAndView renderGenraletings(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render WhiteHall Settings Screen");
		try {			
			model.put(ACTIVETAB, GENERAL_SETTINGS);
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("WhiteHallSettingController.renderSellerSetings() - error occured while rendering Whitehall Settings Screen"+e.getMessage());
		}
		return new ModelAndView(GENERAL_SETTINGS, model);		
	}
	
	@RenderMapping
	protected ModelAndView renderInvestorSettings(@ModelAttribute("investorModel")InvestorModel  investorModel,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render WhiteHall Settings Screen");
		try {
			List<InvestorDTO> investorList=investorService.getInvestorDetails();
			model.put("investorList", investorList);
			model.put(ACTIVETAB, INVESTOR);
			model.put("investorModel", investorModel);	
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("WhiteHallSettingController.renderWhitehallSettings() - error occured while rendering Whitehall Settings Screen"+e.getMessage());
		}
		return new ModelAndView(INVESTOR, model);		
	}
	
	@ActionMapping(params="action=saveInvestorSettings")
	protected void updateInvestorSettings(@ModelAttribute("investorModel")InvestorModel  investorModel,
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		investorService.updateInvestorDetails(investorModel.getInvestorDTO());		
		response.setRenderParameter("render", "investorSettings");
		
	}
	
	@RenderMapping(params = "render=sellerSetings")
	protected ModelAndView renderSellerSetings(@ModelAttribute("sellerDTO")SellerSetting  sellerDTO,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render WhiteHall Settings Screen");
		try {			
			model.put(ACTIVETAB, SELLER);
			model.put("sellerDTO", sellerDTO);	
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("WhiteHallSettingController.renderSellerSetings() - error occured while rendering Whitehall Settings Screen"+e.getMessage());
		}
		return new ModelAndView(SELLER, model);		
	}
	
	@ActionMapping(params="action=saveSellerSettings")
	protected void saveSellerSettings(@ModelAttribute("sellerDTO")SellerSetting  sellerDTO,
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("sellerDTO::"+sellerDTO);
		settingService.saveSellerSettings(sellerDTO);
		response.setRenderParameter("render", "sellerSetings");
		
	}
	

	
	

	@ResourceMapping
	public ModelAndView fetchSettings(ResourceRequest request, ResourceResponse response, ModelMap modelMap)throws IOException {
		String userSelection = ParamUtil.getString(request, "userSelection","");
		System.out.println("userSelection::::"+userSelection);
		String viewName="";
		if(userSelection.equals(LanguageUtil.get(getPortletConfig(request), request.getLocale(), INVESTOR))){
			List<InvestorDTO> investorList=investorService.getInvestorDetails();
			modelMap.put("investorList", investorList);
			viewName=INVESTOR;
		}		
		return new ModelAndView(viewName);
	}

	private PortletConfig getPortletConfig(PortletRequest request) {
		PortletConfig portletConfig = (PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG); 
		return portletConfig;
	}
	
	
}