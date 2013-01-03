package edu.utah.openregistry.batch.peoplesoft;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Simple structure representing the unmarshalled version of the intermediary XML representation of a person flowing inbound from Peoplesoft.
 *
 * Used in the <i>read -> process</i> phases of the Batch job. In the process phase, instances of this record are transformed into Open Registry's
 * <code>ReconciliationCriteria</code> instances which are then passed to the final <i>write</i> phase. After the <i>process</i> phase instances of this
 * structure are discarded.
 *
 * Uses Spring's Jaxb2Marshaller to de-serialize the XML document into this class.
 *
 * @author Dmitriy Kopylenko
 * @author Unicon, inc.
 */
@XmlRootElement(name = "PERSON")
class InboundPeoplesoftPersonRecord implements Serializable {

	@XmlElement
	String UNID;

	@XmlElement
	String EMPLID;

	@XmlElement
	String UID;

	@XmlElement
	String ISONBR;

	@XmlElement
	String FERPA;

	@XmlElement
	String DATE_OF_BIRTH;

	@XmlElement
	String GENDER;

	@XmlElementWrapper(name = "NAMES")
	@XmlElement(name = "NAME")
	List<NAME> NAMES = new ArrayList<NAME>();

	@XmlRootElement
	static class NAME {

		@XmlElement
		String FAMILY_NAME;

		@XmlElement
		String GIVEN_NAME;

		@XmlElement
		String MIDDLE_NAME;

		@XmlElement
		String PREFIX;

		@XmlElement
		String SUFFIX;

		@XmlElement
		String NAME_T;

		@Override
		public String toString() {
			return "NAME{" +
					"FAMILY_NAME='" + FAMILY_NAME + '\'' +
					", GIVEN_NAME='" + GIVEN_NAME + '\'' +
					", MIDDLE_NAME='" + MIDDLE_NAME + '\'' +
					", PREFIX='" + PREFIX + '\'' +
					", SUFFIX='" + SUFFIX + '\'' +
					", NAME_T='" + NAME_T + '\'' +
					'}';
		}
	}

	@XmlElementWrapper(name = "ROLES")
	@XmlElement(name = "ROLE")
	List<ROLE> ROLES = new ArrayList<ROLE>();

	@XmlRootElement
	static class ROLE {

		@XmlElement
		String ID;

		@XmlElement
		String AFFILIATION_DATE;

		@XmlElement
		String ORGANIZATIONAL_UNIT_ID;

		@XmlElement
		String TERMINATION_DATE;

		@XmlElement
		String PERCENT_TIME;

		@XmlElement
		String SPONSOR_ID;

		@XmlElement
		String TITLE;

		@XmlElement
		String AFFILIATION_T;

		@XmlElement
		String PERSON_STATUS_T;

		@XmlElement
		String SPONSOR_T;

		@XmlElement
		String SYSTEM_OF_RECORD_ID;

		@XmlElement
		String TERMINATION_T;

		@XmlElementWrapper(name = "ADDRESSES")
		@XmlElement(name = "ADDRESS")
		List<ADDRESS> ADDRESSES = new ArrayList<ADDRESS>();

		@XmlRootElement
		static class ADDRESS {

			@XmlElement
			String BLDG_NO;

			@XmlElement
			String LINE1;

			@XmlElement
			String LINE2;

			@XmlElement
			String LINE3;

			@XmlElement
			String CITY;

			@XmlElement
			String REGION_ID;

			@XmlElement
			String POSTAL_CODE;

			@XmlElement
			String ROOM_NO;

			@XmlElement
			String UPDATE_DATE;

			@XmlElement
			String COUNTRY_ID;

			@XmlElement
			String ADDRESS_T;

			@Override
			public String toString() {
				return "ADDRESS{" +
						"BLDG_NO='" + BLDG_NO + '\'' +
						", LINE1='" + LINE1 + '\'' +
						", LINE2='" + LINE2 + '\'' +
						", CITY='" + CITY + '\'' +
						", REGION_ID='" + REGION_ID + '\'' +
						", POSTAL_CODE='" + POSTAL_CODE + '\'' +
						", ROOM_NO='" + ROOM_NO + '\'' +
						", UPDATE_DATE='" + UPDATE_DATE + '\'' +
						", COUNTRY_ID='" + COUNTRY_ID + '\'' +
						", ADDRESS_T='" + ADDRESS_T + '\'' +
						'}';
			}
		}

		@XmlElementWrapper(name = "PHONES")
		@XmlElement(name = "PHONE")
		List<PHONE> PHONES = new ArrayList<PHONE>();

		@XmlRootElement
		static class PHONE {

			@XmlElement
			String AREA_CODE;

			@XmlElement
			String COUNTRY_CODE;

			@XmlElement
			String EXTENSION;

			@XmlElement
			String PHONE_NUMBER;

			@XmlElement
			String PHONE_LINE_ORDER;

			@XmlElement
			String UPDATE_DATE;

			@XmlElement
			String ADDRESS_T;

			@XmlElement
			String PHONE_T;

			@Override
			public String toString() {
				return "PHONE{" +
						"AREA_CODE='" + AREA_CODE + '\'' +
						", COUNTRY_CODE='" + COUNTRY_CODE + '\'' +
						", EXTENSION='" + EXTENSION + '\'' +
						", PHONE_NUMBER='" + PHONE_NUMBER + '\'' +
						", PHONE_LINE_ORDER='" + PHONE_LINE_ORDER + '\'' +
						", UPDATE_DATE='" + UPDATE_DATE + '\'' +
						", ADDRESS_T='" + ADDRESS_T + '\'' +
						", PHONE_T='" + PHONE_T + '\'' +
						'}';
			}
		}

		@XmlElementWrapper(name = "EMAILS")
		@XmlElement(name = "EMAIL")
		List<EMAIL> EMAILS = new ArrayList<EMAIL>();

		@XmlRootElement
		static class EMAIL {

			@XmlElement
			String ADDRESS;

			@XmlElement
			String ADDRESS_T;

			@Override
			public String toString() {
				return "EMAIL{" +
						"ADDRESS='" + ADDRESS + '\'' +
						", ADDRESS_T='" + ADDRESS_T + '\'' +
						'}';
			}
		}

		@Override
		public String toString() {
			return "ROLE{" +
					"ID='" + ID + '\'' +
					", TERMINATION_DATE='" + TERMINATION_DATE + '\'' +
					", PERCENT_TIME='" + PERCENT_TIME + '\'' +
					", SPONSOR_ID='" + SPONSOR_ID + '\'' +
					", TITLE='" + TITLE + '\'' +
					", AFFILIATION_T='" + AFFILIATION_T + '\'' +
					", PERSON_STATUS_T='" + PERSON_STATUS_T + '\'' +
					", SPONSOR_T='" + SPONSOR_T + '\'' +
					", SYSTEM_OF_RECORD_ID='" + SYSTEM_OF_RECORD_ID + '\'' +
					", TERMINATION_T='" + TERMINATION_T + '\'' +
					", ADDRESSES=" + ADDRESSES +
					", PHONES=" + PHONES +
					", EMAILS=" + EMAILS +
					'}';
		}
	}

	@Override
	public String toString() {
		return "InboundPeoplesoftPersonRecord{" +
				"UNID='" + UNID + '\'' +
				", EMPLID='" + EMPLID + '\'' +
				", UID='" + UID + '\'' +
				", ISONBR='" + ISONBR + '\'' +
				", FERPA='" + FERPA + '\'' +
				", DATE_OF_BIRTH='" + DATE_OF_BIRTH + '\'' +
				", NAMES=" + NAMES +
				", ROLES=" + ROLES +
				'}';
	}
}
