package com.contact.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(entityName = "Contact", identifierColumn = "id", identifierField = "id", identifierType = Integer.class)
public class Contact {
}
