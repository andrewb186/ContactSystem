// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.customcontrollers.model;

import java.lang.String;

privileged aspect Contact_Roo_JavaBean {
    
    public String Contact.getContactName() {
        return this.contactName;
    }
    
    public void Contact.setContactName(String contactName) {
        this.contactName = contactName;
    }
    
    public String Contact.getContactSurname() {
        return this.contactSurname;
    }
    
    public void Contact.setContactSurname(String contactSurname) {
        this.contactSurname = contactSurname;
    }
    
}
