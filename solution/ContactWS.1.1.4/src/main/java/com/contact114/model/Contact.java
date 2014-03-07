package com.contact114.model;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import com.contact114.model.ContactTypeEnum;
import javax.persistence.Enumerated;
import javax.persistence.EnumType;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class, entityName = "Contact")
public class Contact {

    @NotNull
    @Column(name = "contactName")
    @Size(max = 20)
    private String contactName;

    @NotNull
    @Column(name = "contactType")
    @Enumerated(EnumType.ORDINAL)
    private ContactTypeEnum contactType;
}
