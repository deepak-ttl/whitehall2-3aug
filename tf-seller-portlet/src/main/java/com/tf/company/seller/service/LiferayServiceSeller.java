package com.tf.company.seller.service;

import javax.portlet.ActionRequest;

import com.liferay.portal.DuplicateUserEmailAddressException;
import com.liferay.portal.DuplicateUserScreenNameException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.User;

public interface LiferayServiceSeller {
	
	public void addUserInformation(User user, ActionRequest request,
			boolean createUser, ThemeDisplay themeDisplay, Long officerId)
			throws PortalException, SystemException, DuplicateUserEmailAddressException,DuplicateUserScreenNameException;

}
