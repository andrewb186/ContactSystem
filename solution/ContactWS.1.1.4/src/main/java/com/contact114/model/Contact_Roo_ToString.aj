// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.contact114.model;

import java.lang.String;

privileged aspect Contact_Roo_ToString {
    
    public String Contact.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ContactName: ").append(getContactName()).append(", ");
        sb.append("ContactSurname: ").append(getContactSurname()).append(", ");
        sb.append("ContactType: ").append(getContactType()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
