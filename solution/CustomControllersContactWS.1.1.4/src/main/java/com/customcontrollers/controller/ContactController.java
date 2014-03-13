package com.customcontrollers.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.customcontrollers.model.Contact;

@RequestMapping("/mycontact")
@Controller
public class ContactController {
	
	@RequestMapping(value = "/getUser/{userID}", method = RequestMethod.GET)
	@ResponseBody
	Contact getUser(@PathVariable String userID) {
		Contact contact = new Contact();
		try {
			int id = Integer.parseInt(userID);
			contact = Contact.findContact(id);
			System.out.println(contact.toString());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return contact;
		// return contact.toJson();
	}
	
	


}
