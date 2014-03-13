package com.customcontrollers.model;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class, entityName = "Contact")
@RooJson
public class Contact {

    @NotNull
    @Column(name = "contactName")
    @Size(max = 20)
    private String contactName;

    @NotNull
    @Column(name = "contactSurname")
    @Size(max = 20)
    private String contactSurname;
}
