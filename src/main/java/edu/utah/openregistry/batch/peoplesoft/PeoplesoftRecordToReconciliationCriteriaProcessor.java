package edu.utah.openregistry.batch.peoplesoft;

import org.apache.commons.lang.time.DateUtils;
import org.openregistry.core.domain.*;
import org.openregistry.core.domain.jpa.sor.JpaReconciliationCriteriaImpl;
import org.openregistry.core.domain.jpa.sor.JpaSorPersonImpl;
import org.openregistry.core.domain.sor.ReconciliationCriteria;
import org.openregistry.core.domain.sor.SorName;
import org.openregistry.core.domain.sor.SorRole;
import org.openregistry.core.repository.ReferenceRepository;
import org.springframework.batch.item.ItemProcessor;

import javax.inject.Inject;
import java.net.URL;
import java.util.UUID;


/**
 * Spring Batch <code>ItemProcessor</code> to transform intermediary representation of incoming person records to Open Registry's
 * <code>ReconciliationCriteria</code> instances which are used in the <i>write</i> phase of inbound batch job's step.
 *
 * @author Dmitriy Kopylenko
 * @author Unicon, inc.
 */
public class PeoplesoftRecordToReconciliationCriteriaProcessor implements
		ItemProcessor<InboundPeoplesoftPersonRecord, ReconciliationCriteria> {


	@Inject
	private ReferenceRepository referenceRepository;

	private static final String DEFAULT_GENDER = "M";

	private static final String SYSTEM_OF_RECORD = "PEOPLESOFT";

	private static final String DEFAULT_ROLE_TITLE = "Role Title is Required"; //Default for this POC

	private static final String DEFAULT_ORG_UNIT = "MATH"; //Default for this POC

	private static final int DEFAULT_PERCENTAGE = 100; //Default for this POC

	private static final String DEFAULT_COUNTRY = "US";

	private static final String DEFAULT_AFFILIATION_DATE = "010170";

	private static final String DEFAULT_SPONSOR_TYPE = "Person";

	private static final String DEFAULT_PERSON_STATUS = "Active";

	private static final String DEFAULT_PHONE_COUNTRY_CODE = "1";

	private static final String DEFAULT_PHONE_AREA_CODE = "111";

	private static final String DEFAULT_PHONE_TYPE = "Land";

	@Override
	public ReconciliationCriteria process(final InboundPeoplesoftPersonRecord peoplesoftPersonRecord) throws Exception {
		final JpaReconciliationCriteriaImpl reconciliationCriteria = new JpaReconciliationCriteriaImpl();
		final JpaSorPersonImpl sorPerson = new JpaSorPersonImpl();

		//Person
		sorPerson.setGender(DEFAULT_GENDER); //TODO: need incoming gender
		sorPerson.setSorId(peoplesoftPersonRecord.EMPLID); //TODO: Assuming EMPLID is the sorId for people
		//sorPerson.setSsn(""); //TODO: need incoming SSN (optional in OR)
		sorPerson.setSourceSor(SYSTEM_OF_RECORD);
		sorPerson.setDateOfBirth(DateUtils.parseDate(peoplesoftPersonRecord.DATE_OF_BIRTH, new String[] {"MMddyy"})); //TODO: need incoming DOB

		//Names
		for (InboundPeoplesoftPersonRecord.NAME name : peoplesoftPersonRecord.NAMES) {
			SorName sorName = sorPerson.addName();
			sorName.setFamily(name.FAMILY_NAME);
			sorName.setGiven(name.GIVEN_NAME);
			sorName.setMiddle(nonEmptyTrimmedValueOrNull(name.MIDDLE_NAME));
			sorName.setPrefix(nonEmptyTrimmedValueOrNull(name.PREFIX));
			sorName.setSuffix(nonEmptyTrimmedValueOrNull(name.SUFFIX));
			sorName.setType(this.referenceRepository.findType(Type.DataTypes.NAME, name.NAME_T)); //TODO: need to add Utah's name types to ctx_data_types table e.g. 'PRF', 'PRI'
		}

		//Roles
		for (InboundPeoplesoftPersonRecord.ROLE role : peoplesoftPersonRecord.ROLES) {
			SorRole sorRole = sorPerson.createRole(this.referenceRepository.findType(Type.DataTypes.AFFILIATION, role.AFFILIATION_T.trim())); //TODO: need to add Utah's affiliation types to ctx_data_types e.g. 'uuCurrentEmployee
			sorRole.setSorId(UUID.randomUUID().toString()); //TODO: figure out how to deal with sorRole.sorId??? Random UUID for now
			sorRole.setStart(DateUtils.parseDate(DEFAULT_AFFILIATION_DATE, new String[] {"MMddyy"})); //TODO: need incoming role start date (REQUIRED). Hardcoded for now.
			sorRole.setTitle(role.TITLE.trim().length() == 0 ? DEFAULT_ROLE_TITLE : role.TITLE.trim()); //TODO: need incoming role title (REQUIRED)
			sorRole.setOrganizationalUnit(this.referenceRepository.getOrganizationalUnitByCode(DEFAULT_ORG_UNIT)); //TODO: using default one for this POC. Need to populate all the org units ref data table
			sorRole.setSystemOfRecord(this.referenceRepository.findSystemOfRecord(SYSTEM_OF_RECORD));
			sorRole.setSponsorId(role.SPONSOR_ID.trim().length() == 0 ? 1L : Long.valueOf(role.SPONSOR_ID.trim())); //TODO: need incoming sponsor id. Using hardcoded for this POC
			sorRole.setSponsorType(this.referenceRepository.findType(Type.DataTypes.SPONSOR, DEFAULT_SPONSOR_TYPE)); //TODO: need incoming sponsor type (REQUIRED) Using hardcoded for this POC
			sorRole.setPersonStatus(this.referenceRepository.findType(Type.DataTypes.STATUS, DEFAULT_PERSON_STATUS)); //TODO: need incoming person status (REQUIRED). Using hardcoded for this POC
			sorRole.setPercentage(role.PERCENT_TIME.trim().length() == 0 ? DEFAULT_PERCENTAGE : Integer.valueOf(role.PERCENT_TIME.trim())); //TODO: need incoming percentage (REQUIRED). Using hardcoded for this POC.
			//sorRole.setTerminationReason(null); //TODO: need to add Utah's termination types to ctx_data_types table

			//Addresses
			for (InboundPeoplesoftPersonRecord.ROLE.ADDRESS address : role.ADDRESSES) {
				Address sorRoleAddress = sorRole.createAddress();
				sorRoleAddress.setLine1(address.LINE1.trim()); //TODO: required
				sorRoleAddress.setLine2(nonEmptyTrimmedValueOrNull(address.LINE2));
				sorRoleAddress.setLine3(nonEmptyTrimmedValueOrNull(address.LINE3));
				sorRoleAddress.setCity(address.CITY.trim()); //TODO required
				sorRoleAddress.setRegion(this.referenceRepository.getRegionByCodeAndCountryId(address.REGION_ID.trim(), DEFAULT_COUNTRY)); //TODO: region and country are required. Using the hardcoded country for this POC
				sorRoleAddress.setPostalCode(nonEmptyTrimmedValueOrNull(address.POSTAL_CODE));
				sorRoleAddress.setCountry(this.referenceRepository.getCountryByCode(DEFAULT_COUNTRY)); //TODO: need incoming country id. Using hardcoded for this POC
				sorRoleAddress.setBldgNo(nonEmptyTrimmedValueOrNull(address.BLDG_NO));
				sorRoleAddress.setType(this.referenceRepository.findType(Type.DataTypes.ADDRESS, address.ADDRESS_T.trim())); //TODO: need Utah's specific ref data values in ctx_data_types table
				sorRole.addAddress(sorRoleAddress);
			}

			//Email Addresses
			for (InboundPeoplesoftPersonRecord.ROLE.EMAIL email : role.EMAILS) {
				EmailAddress sorRoleEmail = sorRole.createEmailAddress();
				sorRoleEmail.setAddress(email.ADDRESS.trim()); //TODO: required
				sorRoleEmail.setAddressType(this.referenceRepository.findType(Type.DataTypes.ADDRESS, email.ADDRESS_T.trim())); //TODO: need to add Utah's specific ref data values in ctx_data_types
				sorRole.addEmailAddress(sorRoleEmail);
			}

			//Phones
			for (InboundPeoplesoftPersonRecord.ROLE.PHONE phone : role.PHONES) {
				Phone sorRolePhone = sorRole.createPhone();
				sorRolePhone.setAreaCode(phone.AREA_CODE == null ? DEFAULT_PHONE_AREA_CODE : phone.AREA_CODE); //TODO: required
				sorRolePhone.setCountryCode(DEFAULT_PHONE_COUNTRY_CODE); //TODO: required
				sorRolePhone.setNumber(phone.PHONE_NUMBER.trim()); //TODO: required
				sorRolePhone.setExtension(nonEmptyTrimmedValueOrNull(phone.EXTENSION));
				sorRolePhone.setPhoneType(this.referenceRepository.findType(Type.DataTypes.PHONE, DEFAULT_PHONE_TYPE)); //TODO: need incoming phone type. Using hardcoded 'Land' for this POC
				sorRolePhone.setAddressType(this.referenceRepository.findType(Type.DataTypes.ADDRESS, phone.PHONE_T == null ? "emp" : phone.PHONE_T.toLowerCase())); //TODO: need to add Utah's specific ref data values to ctx_data_types table
				sorRolePhone.setPhoneLineOrder(phone.PHONE_LINE_ORDER.trim().length() == 0 ? 1 : Integer.valueOf(phone.PHONE_LINE_ORDER.trim())); //TODO: need to add incoming phone line order. Using hardcoded '1' for this POC
				sorRole.addPhone(sorRolePhone);
			}

			//TODO: Urls are also supported. Could just ignore them for this POC
			/*Url url = sorRole.createUrl();
			url.setUrl(new URL("http://myblog2.example.com"));
			url.setType(this.referenceRepository.findType(Type.DataTypes.URL, "Personal"));
			sorRole.addUrl(url); */

			//Now add the role to the person
			sorPerson.addRole(sorRole);
		}

		//Finally package the incoming SOR person in ReconciliationCriteria and return to Spring Batch for the final 'write' phase of the job's step
		reconciliationCriteria.setSorPerson(sorPerson);
		return reconciliationCriteria;
	}

	private String nonEmptyTrimmedValueOrNull(String value) {
		//No need for null check as the callsite for this method is confined within this instance
		return value.trim().length() == 0 ? null : value.trim();
	}
}
