// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.simplecontactws114.controller;

import com.simplecontactws114.model.Contact;
import com.simplecontactws114.model.enums.ContactType;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Arrays;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ContactController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ContactController.create(@Valid Contact contact, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("contact", contact);
            return "contacts/create";
        }
        uiModel.asMap().clear();
        contact.persist();
        return "redirect:/contacts/" + encodeUrlPathSegment(contact.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ContactController.createForm(Model uiModel) {
        uiModel.addAttribute("contact", new Contact());
        return "contacts/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ContactController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("contact", Contact.findContact(id));
        uiModel.addAttribute("itemId", id);
        return "contacts/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ContactController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("contacts", Contact.findContactEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Contact.countContacts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("contacts", Contact.findAllContacts());
        }
        return "contacts/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ContactController.update(@Valid Contact contact, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("contact", contact);
            return "contacts/update";
        }
        uiModel.asMap().clear();
        contact.merge();
        return "redirect:/contacts/" + encodeUrlPathSegment(contact.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ContactController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("contact", Contact.findContact(id));
        return "contacts/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ContactController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Contact.findContact(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/contacts";
    }
    
    @ModelAttribute("contacts")
    public Collection<Contact> ContactController.populateContacts() {
        return Contact.findAllContacts();
    }
    
    @ModelAttribute("contacttypes")
    public Collection<ContactType> ContactController.populateContactTypes() {
        return Arrays.asList(ContactType.class.getEnumConstants());
    }
    
    String ContactController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
