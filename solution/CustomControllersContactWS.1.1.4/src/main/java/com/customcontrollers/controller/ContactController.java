package com.customcontrollers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.customcontrollers.model.Contact;


@RequestMapping("/mycontact")
@Controller
public class ContactController {
	
	@RequestMapping(value = "/getUser/{userID}", method = RequestMethod.GET)
	@ResponseBody
	Contact getUser(@PathVariable("userID") String userID) {
		Contact contact = new Contact();
		try {
			int id = Integer.parseInt(userID);
			contact = Contact.findContact(id);
			System.out.println(contact.toString());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return contact;
	}//End of method Get User
	
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	String addUser(@RequestBody Contact contact){
		Contact tmp = contact;
		tmp.persist();
		tmp.flush();
		return tmp.getId().toString();
	}

	
	@RequestMapping(value = "/updateUser", method = RequestMethod.PUT)
	@ResponseBody
	String updateUser(@RequestBody Contact contact) {
		Contact c = (Contact) contact;
		try {
			//Contact c = (Contact) contact;
			c.merge();
			c.flush();
			System.out.println(c.getId());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return c.getId().toString();
	}
	
	
//	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
//	@ResponseBody
//	String deleteUser(@RequestBody Contact contact){
//		return "Delete OK";
//	}
	

}
