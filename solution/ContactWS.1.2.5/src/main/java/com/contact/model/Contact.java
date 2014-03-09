package com.contact.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.contact.model.enums.Gender;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import com.contact.model.enums.ContactType;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(entityName = "Contact", identifierColumn = "id", identifierField = "id", identifierType = Integer.class)
public class Contact {

    /**
     */
    @NotNull
    @Column(name = "contactName")
    @Size(max = 20)
    private String contactName;

    /**
     */
    @NotNull
    @Column(name = "contactSurname")
    @Size(max = 20)
    private String contactSurname;

    /**
     */
    @Column(name = "contactGender")
    @Enumerated(EnumType.STRING)
    private Gender contactGender;

    /**
     */
    @Column(name = "contactType")
    @Enumerated(EnumType.STRING)
    private ContactType contactType;
}
