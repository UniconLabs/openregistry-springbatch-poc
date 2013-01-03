
    create table AUTH_GROUP_AUTHORITY (
        GROUP_ID bigint not null,
        AUTHORITY_ID bigint not null
    );

    create table AUTH_USER_GROUP (
        USER_ID bigint not null,
        GROUP_ID bigint not null
    );

    create table AUX_IDENTIFIERS (
        id bigint not null auto_increment,
        CREATION_DATE datetime not null,
        IS_DELETED bit not null,
        DELETED_DATE datetime,
        NOTIFICATION_DATE datetime,
        IS_PRIMARY bit not null,
        IDENTIFIER varchar(100) not null,
        PROGRAM_ID bigint not null,
        IDENTIFIER_T bigint not null,
        primary key (id),
        unique (IDENTIFIER_T, IDENTIFIER)
    );

    create table AUX_PROGRAMS (
        id bigint not null auto_increment,
        AFFILIATION_DATE date not null,
        PROGRAM_NAME varchar(255) not null,
        SPONSOR_ID bigint not null,
        TERMINATION_DATE date,
        SPONSOR_T bigint not null,
        primary key (id)
    );

    create table SpringSecurityRevisionEntity (
        id integer not null auto_increment,
        timestamp bigint not null,
        username varchar(255),
        primary key (id)
    );

    create table aud_AUTH_GROUP_AUTHORITY (
        REV integer not null,
        GROUP_ID bigint not null,
        AUTHORITY_ID bigint not null,
        REVTYPE tinyint,
        primary key (REV, GROUP_ID, AUTHORITY_ID)
    );

    create table aud_AUTH_USER_GROUP (
        REV integer not null,
        USER_ID bigint not null,
        GROUP_ID bigint not null,
        REVTYPE tinyint,
        primary key (REV, USER_ID, GROUP_ID)
    );

    create table aud_AUX_IDENTIFIERS (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        CREATION_DATE datetime,
        IS_DELETED bit,
        DELETED_DATE datetime,
        NOTIFICATION_DATE datetime,
        IS_PRIMARY bit,
        IDENTIFIER varchar(100),
        PROGRAM_ID bigint,
        IDENTIFIER_T bigint,
        primary key (id, REV)
    );

    create table aud_AUX_PROGRAMS (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        AFFILIATION_DATE date,
        PROGRAM_NAME varchar(255),
        SPONSOR_ID bigint,
        TERMINATION_DATE date,
        SPONSOR_T bigint,
        primary key (id, REV)
    );

    create table aud_auth_authorities (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        AUTHORITY_NAME varchar(255),
        DESCRIPTION varchar(255),
        primary key (id, REV)
    );

    create table aud_auth_groups (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        DESCRIPTION varchar(255),
        IS_ENABLED bit,
        GROUP_NAME varchar(255),
        primary key (id, REV)
    );

    create table aud_auth_users (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        DESCRIPTION varchar(255),
        IS_ENABLED bit,
        PASSWORD varchar(255),
        USER_NAME varchar(255),
        primary key (id, REV)
    );

    create table aud_ctd_countries (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        code varchar(3),
        name varchar(100),
        primary key (id, REV)
    );

    create table aud_ctd_regions (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        code varchar(3),
        name varchar(100),
        country_id bigint,
        primary key (id, REV)
    );

    create table aud_ctx_data_types (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        data_type varchar(100),
        description varchar(100),
        primary key (id, REV)
    );

    create table aud_drd_organizational_units (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        code varchar(100),
        name varchar(100),
        campus_id bigint,
        parent_organizational_unit_id bigint,
        organizational_unit_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_addresses (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        bldg_no varchar(10),
        city varchar(100),
        line1 varchar(100),
        line2 varchar(100),
        line3 varchar(100),
        postal_code varchar(9),
        room_no varchar(11),
        update_date datetime,
        country_id bigint,
        region_id bigint,
        role_record_id bigint,
        address_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_contact_emails (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        address varchar(100),
        email_address_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_contact_phones (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        area_code varchar(5),
        country_code varchar(5),
        extension varchar(5),
        phone_number varchar(10),
        phone_line_order integer,
        update_date datetime,
        address_t bigint,
        phone_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_disclosure (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        disclosure_code varchar(10),
        updated_date datetime,
        within_grace_period bit,
        person_id bigint,
        primary key (id, REV)
    );

    create table aud_prc_disclosure_address (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        bldg_room_date datetime,
        bldg_room_ind bit,
        address_date datetime,
        address_ind bit,
        city_region_date datetime,
        city_region_ind bit,
        address_t bigint,
        affiliation_t bigint,
        disclosure_record_id bigint,
        primary key (id, REV)
    );

    create table aud_prc_disclosure_email (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        public_date datetime,
        public_ind bit,
        affiliation_t bigint,
        disclosure_record_id bigint,
        address_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_disclosure_phone (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        public_date datetime,
        public_ind bit,
        address_t bigint,
        affiliation_t bigint,
        disclosure_record_id bigint,
        phone_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_disclosure_url (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        public_date datetime,
        public_ind bit,
        affiliation_t bigint,
        disclosure_record_id bigint,
        address_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_emails (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        address varchar(100),
        role_record_id bigint,
        address_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_identifiers (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        change_expiration_date datetime,
        changeable bit,
        creation_date datetime,
        is_deleted bit,
        deleted_date datetime,
        notification_date datetime,
        is_primary bit,
        identifier varchar(100),
        person_id bigint,
        identifier_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_leaves_of_absence (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        end_date date,
        start_date date,
        leave_t bigint,
        role_record_id bigint,
        primary key (id, REV)
    );

    create table aud_prc_names (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        family_name varchar(100),
        family_comparison_value varchar(100),
        given_name varchar(100),
        given_comparison_value varchar(100),
        middle_name varchar(100),
        is_official_name bit,
        is_preferred_name bit,
        prefix varchar(5),
        name_source_id bigint,
        suffix varchar(5),
        person_id bigint,
        name_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_persons (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        act_key_end_date datetime,
        act_key_lock varchar(255),
        act_key_lock_expiration datetime,
        act_key_start_date datetime,
        activation_key varchar(255),
        date_of_birth date,
        gender varchar(1),
        contact_email_id bigint,
        contact_phone_id bigint,
        primary key (id, REV)
    );

    create table aud_prc_phones (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        area_code varchar(5),
        country_code varchar(5),
        extension varchar(5),
        phone_number varchar(10),
        phone_line_order integer,
        update_date datetime,
        address_t bigint,
        phone_t bigint,
        role_record_id bigint,
        primary key (id, REV)
    );

    create table aud_prc_role_records (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        termination_date date,
        percent_time integer,
        prs_role_id bigint,
        sponsor_id bigint,
        affiliation_date date,
        title varchar(100),
        affiliation_t bigint,
        organizational_unit_id bigint,
        person_id bigint,
        person_status_t bigint,
        sponsor_t bigint,
        termination_t bigint,
        primary key (id, REV)
    );

    create table aud_prc_urls (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        url varchar(500),
        role_record_id bigint,
        address_t bigint,
        primary key (id, REV)
    );

    create table aud_prd_campuses (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        code varchar(2),
        name varchar(100),
        primary key (id, REV)
    );

    create table aud_prd_identifier_types (
        identifier_t bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        deleted bit,
        description varchar(200),
        format varchar(100),
        modifiable bit,
        name varchar(100),
        notifiable bit,
        private bit,
        primary key (identifier_t, REV)
    );

    create table aud_prd_system_of_record (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        sor_id varchar(100),
        primary key (id, REV)
    );

    create table aud_prs_addresses (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        bldg_no varchar(10),
        city varchar(100),
        line1 varchar(100),
        line2 varchar(100),
        line3 varchar(100),
        postal_code varchar(9),
        room_no varchar(11),
        update_date datetime,
        country_id bigint,
        region_id bigint,
        role_record_id bigint,
        address_t bigint,
        primary key (id, REV)
    );

    create table aud_prs_disclosure (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        disclosure_code varchar(10),
        updated_date datetime,
        within_grace_period bit,
        sor_person_id bigint,
        primary key (id, REV)
    );

    create table aud_prs_emails (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        address varchar(100),
        address_t bigint,
        role_record_id bigint,
        primary key (id, REV)
    );

    create table aud_prs_leaves_of_absence (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        end_date date,
        start_date date,
        leave_t bigint,
        role_record_id bigint,
        primary key (id, REV)
    );

    create table aud_prs_names (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        family_name varchar(100),
        given_name varchar(100),
        middle_name varchar(100),
        prefix varchar(5),
        suffix varchar(5),
        sor_person_id bigint,
        name_t bigint,
        primary key (id, REV)
    );

    create table aud_prs_phones (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        area_code varchar(5),
        country_code varchar(5),
        extension varchar(5),
        phone_number varchar(10),
        phone_line_order integer,
        update_date datetime,
        address_t bigint,
        phone_t bigint,
        role_record_id bigint,
        primary key (id, REV)
    );

    create table aud_prs_role_records (
        record_id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        termination_date date,
        percent_time integer,
        id varchar(255),
        sponsor_id bigint,
        affiliation_date date,
        title varchar(100),
        affiliation_t bigint,
        organizational_unit_id bigint,
        sor_person_id bigint,
        person_status_t bigint,
        sponsor_t bigint,
        system_of_record_id bigint,
        termination_t bigint,
        primary key (record_id, REV)
    );

    create table aud_prs_sor_persons (
        record_id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        date_of_birth date,
        gender varchar(1),
        person_id bigint,
        id varchar(255),
        source_sor_id varchar(255),
        ssn varchar(9),
        primary key (record_id, REV)
    );

    create table aud_prs_sor_persons_loc_attr (
        REV integer not null,
        sor_person_record_id bigint not null,
        attribute_value varchar(255) not null,
        attribute_type varchar(255) not null,
        REVTYPE tinyint,
        primary key (REV, sor_person_record_id, attribute_value, attribute_type)
    );

    create table aud_prs_urls (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        url varchar(500),
        role_record_id bigint,
        address_t bigint,
        primary key (id, REV)
    );

    create table auth_authorities (
        id bigint not null auto_increment,
        AUTHORITY_NAME varchar(255) not null,
        DESCRIPTION varchar(255),
        primary key (id)
    );

    create table auth_groups (
        id bigint not null auto_increment,
        DESCRIPTION varchar(255),
        IS_ENABLED bit not null,
        GROUP_NAME varchar(255) not null,
        primary key (id)
    );

    create table auth_users (
        id bigint not null auto_increment,
        DESCRIPTION varchar(255),
        IS_ENABLED bit not null,
        PASSWORD varchar(255),
        USER_NAME varchar(255) not null,
        primary key (id)
    );

    create table ctd_countries (
        id bigint not null auto_increment,
        code varchar(3) not null,
        name varchar(100) not null,
        primary key (id)
    );

    create table ctd_regions (
        id bigint not null auto_increment,
        code varchar(3) not null,
        name varchar(100) not null,
        country_id bigint not null,
        primary key (id),
        unique (country_id, code)
    );

    create table ctx_data_types (
        id bigint not null auto_increment,
        data_type varchar(100) not null,
        description varchar(100) not null,
        primary key (id),
        unique (data_type, description)
    );

    create table drd_organizational_units (
        id bigint not null auto_increment,
        code varchar(100),
        name varchar(100) not null,
        campus_id bigint,
        parent_organizational_unit_id bigint,
        organizational_unit_t bigint not null,
        primary key (id)
    );

    create table prc_addresses (
        id bigint not null auto_increment,
        bldg_no varchar(10),
        city varchar(100) not null,
        line1 varchar(100),
        line2 varchar(100),
        line3 varchar(100),
        postal_code varchar(9),
        room_no varchar(11),
        update_date datetime not null,
        country_id bigint,
        region_id bigint,
        role_record_id bigint not null,
        address_t bigint,
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prc_contact_emails (
        id bigint not null auto_increment,
        address varchar(100),
        email_address_t bigint,
        primary key (id)
    );

    create table prc_contact_phones (
        id bigint not null auto_increment,
        area_code varchar(5),
        country_code varchar(5),
        extension varchar(5),
        phone_number varchar(10),
        phone_line_order integer,
        update_date datetime not null,
        address_t bigint,
        phone_t bigint,
        primary key (id)
    );

    create table prc_disclosure (
        id bigint not null auto_increment,
        disclosure_code varchar(10),
        updated_date datetime not null,
        within_grace_period bit not null,
        person_id bigint not null,
        primary key (id),
        unique (person_id)
    );

    create table prc_disclosure_address (
        id bigint not null auto_increment,
        bldg_room_date datetime not null,
        bldg_room_ind bit not null,
        address_date datetime not null,
        address_ind bit not null,
        city_region_date datetime not null,
        city_region_ind bit not null,
        address_t bigint not null,
        affiliation_t bigint not null,
        disclosure_record_id bigint not null,
        primary key (id),
        unique (address_t, affiliation_t, disclosure_record_id)
    );

    create table prc_disclosure_email (
        id bigint not null auto_increment,
        public_date datetime not null,
        public_ind bit not null,
        affiliation_t bigint not null,
        disclosure_record_id bigint not null,
        address_t bigint not null,
        primary key (id),
        unique (address_t, affiliation_t, disclosure_record_id)
    );

    create table prc_disclosure_phone (
        id bigint not null auto_increment,
        public_date datetime not null,
        public_ind bit not null,
        address_t bigint not null,
        affiliation_t bigint not null,
        disclosure_record_id bigint not null,
        phone_t bigint not null,
        primary key (id),
        unique (address_t, phone_t, affiliation_t, disclosure_record_id)
    );

    create table prc_disclosure_url (
        id bigint not null auto_increment,
        public_date datetime not null,
        public_ind bit not null,
        affiliation_t bigint not null,
        disclosure_record_id bigint not null,
        address_t bigint not null,
        primary key (id),
        unique (address_t, affiliation_t, disclosure_record_id)
    );

    create table prc_emails (
        id bigint not null auto_increment,
        address varchar(100) not null,
        role_record_id bigint not null,
        address_t bigint not null,
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prc_identifiers (
        id bigint not null auto_increment,
        change_expiration_date datetime,
        changeable bit,
        creation_date datetime not null,
        is_deleted bit not null,
        deleted_date datetime,
        notification_date datetime,
        is_primary bit not null,
        identifier varchar(100) not null,
        person_id bigint not null,
        identifier_t bigint not null,
        primary key (id),
        unique (identifier_t, identifier)
    );

    create table prc_leaves_of_absence (
        id bigint not null auto_increment,
        end_date date,
        start_date date,
        leave_t bigint not null,
        role_record_id bigint not null,
        primary key (id)
    );

    create table prc_names (
        id bigint not null auto_increment,
        family_name varchar(100),
        family_comparison_value varchar(100),
        given_name varchar(100) not null,
        given_comparison_value varchar(100),
        middle_name varchar(100),
        is_official_name bit not null,
        is_preferred_name bit not null,
        prefix varchar(5),
        name_source_id bigint not null,
        suffix varchar(5),
        person_id bigint not null,
        name_t bigint not null,
        primary key (id)
    );

    create table prc_persons (
        id bigint not null auto_increment,
        act_key_end_date datetime,
        act_key_lock varchar(255),
        act_key_lock_expiration datetime,
        act_key_start_date datetime,
        activation_key varchar(255),
        date_of_birth date,
        gender varchar(1),
        contact_email_id bigint,
        contact_phone_id bigint,
        primary key (id)
    );

    create table prc_phones (
        id bigint not null auto_increment,
        area_code varchar(5) not null,
        country_code varchar(5) not null,
        extension varchar(5),
        phone_number varchar(10) not null,
        phone_line_order integer not null,
        update_date datetime not null,
        address_t bigint not null,
        phone_t bigint not null,
        role_record_id bigint not null,
        primary key (id),
        unique (phone_t, address_t, phone_line_order, role_record_id)
    );

    create table prc_role_records (
        id bigint not null auto_increment,
        termination_date date,
        percent_time integer not null,
        prs_role_id bigint,
        sponsor_id bigint not null,
        affiliation_date date not null,
        title varchar(100) not null,
        affiliation_t bigint not null,
        organizational_unit_id bigint not null,
        person_id bigint not null,
        person_status_t bigint not null,
        sponsor_t bigint not null,
        termination_t bigint,
        primary key (id),
        unique (person_id, affiliation_t, organizational_unit_id)
    );

    create table prc_urls (
        id bigint not null auto_increment,
        url varchar(500) not null,
        role_record_id bigint not null,
        address_t bigint not null,
        primary key (id)
    );

    create table prd_campuses (
        id bigint not null auto_increment,
        code varchar(2) not null,
        name varchar(100) not null,
        primary key (id),
        unique (code, name)
    );

    create table prd_identifier_types (
        identifier_t bigint not null auto_increment,
        deleted bit not null,
        description varchar(200) not null,
        format varchar(100) not null,
        modifiable bit not null,
        name varchar(100) not null,
        notifiable bit not null,
        private bit not null,
        primary key (identifier_t),
        unique (name)
    );

    create table prd_system_of_record (
        id bigint not null auto_increment,
        sor_id varchar(100) not null unique,
        primary key (id)
    );

    create table prs_addresses (
        id bigint not null auto_increment,
        bldg_no varchar(10),
        city varchar(100) not null,
        line1 varchar(100) not null,
        line2 varchar(100),
        line3 varchar(100),
        postal_code varchar(9),
        room_no varchar(11),
        update_date datetime not null,
        country_id bigint not null,
        region_id bigint,
        role_record_id bigint not null,
        address_t bigint not null,
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prs_disclosure (
        id bigint not null auto_increment,
        disclosure_code varchar(10) not null,
        updated_date datetime not null,
        within_grace_period bit not null,
        sor_person_id bigint not null,
        primary key (id),
        unique (sor_person_id)
    );

    create table prs_emails (
        id bigint not null auto_increment,
        address varchar(100) not null,
        address_t bigint not null,
        role_record_id bigint not null,
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prs_leaves_of_absence (
        id bigint not null auto_increment,
        end_date date,
        start_date date not null,
        leave_t bigint not null,
        role_record_id bigint not null,
        primary key (id)
    );

    create table prs_names (
        id bigint not null auto_increment,
        family_name varchar(100),
        given_name varchar(100) not null,
        middle_name varchar(100),
        prefix varchar(5),
        suffix varchar(5),
        sor_person_id bigint not null,
        name_t bigint not null,
        primary key (id)
    );

    create table prs_phones (
        id bigint not null auto_increment,
        area_code varchar(5) not null,
        country_code varchar(5) not null,
        extension varchar(5),
        phone_number varchar(10) not null,
        phone_line_order integer not null,
        update_date datetime not null,
        address_t bigint not null,
        phone_t bigint not null,
        role_record_id bigint not null,
        primary key (id),
        unique (phone_t, address_t, phone_line_order, role_record_id)
    );

    create table prs_role_records (
        record_id bigint not null auto_increment,
        termination_date date,
        percent_time integer not null,
        id varchar(255) not null,
        sponsor_id bigint not null,
        affiliation_date date not null,
        title varchar(100) not null,
        affiliation_t bigint not null,
        organizational_unit_id bigint not null,
        sor_person_id bigint not null,
        person_status_t bigint not null,
        sponsor_t bigint not null,
        system_of_record_id bigint not null,
        termination_t bigint,
        primary key (record_id),
        unique (system_of_record_id, id, affiliation_t)
    );

    create table prs_sor_persons (
        record_id bigint not null auto_increment,
        date_of_birth date,
        gender varchar(1),
        person_id bigint,
        id varchar(255),
        source_sor_id varchar(255) not null,
        ssn varchar(9),
        primary key (record_id)
    );

    create table prs_sor_persons_loc_attr (
        sor_person_record_id bigint not null,
        attribute_value varchar(255),
        attribute_type varchar(255) not null,
        primary key (sor_person_record_id, attribute_type)
    );

    create table prs_urls (
        id bigint not null auto_increment,
        url varchar(500) not null,
        role_record_id bigint not null,
        address_t bigint not null,
        primary key (id)
    );

    alter table AUTH_GROUP_AUTHORITY 
        add index FK9884C0AC417C4AB9 (AUTHORITY_ID), 
        add constraint FK9884C0AC417C4AB9 
        foreign key (AUTHORITY_ID) 
        references auth_authorities (id);

    alter table AUTH_GROUP_AUTHORITY 
        add index FK9884C0ACAD419AB9 (GROUP_ID), 
        add constraint FK9884C0ACAD419AB9 
        foreign key (GROUP_ID) 
        references auth_groups (id);

    alter table AUTH_USER_GROUP 
        add index FK435AE7E2DE47541B (USER_ID), 
        add constraint FK435AE7E2DE47541B 
        foreign key (USER_ID) 
        references auth_users (id);

    alter table AUTH_USER_GROUP 
        add index FK435AE7E2AD419AB9 (GROUP_ID), 
        add constraint FK435AE7E2AD419AB9 
        foreign key (GROUP_ID) 
        references auth_groups (id);

    create index AUX_PROGRAM_IDX on AUX_IDENTIFIERS (PROGRAM_ID);

    create index AUX_IDENTIFIER_IDX on AUX_IDENTIFIERS (IDENTIFIER);

    create index AUX_ID_ID_TYPE_IDX on AUX_IDENTIFIERS (IDENTIFIER, IDENTIFIER_T);

    alter table AUX_IDENTIFIERS 
        add index FK793103AF4CBB02D1 (IDENTIFIER_T), 
        add constraint FK793103AF4CBB02D1 
        foreign key (IDENTIFIER_T) 
        references prd_identifier_types (identifier_t);

    alter table AUX_IDENTIFIERS 
        add index FK793103AF25BEDB04 (PROGRAM_ID), 
        add constraint FK793103AF25BEDB04 
        foreign key (PROGRAM_ID) 
        references AUX_PROGRAMS (id);

    create index AUTH_PROGRAM_NAME_IDX on AUX_PROGRAMS (PROGRAM_NAME);

    alter table AUX_PROGRAMS 
        add index FK55A90DAA27B2F539 (SPONSOR_T), 
        add constraint FK55A90DAA27B2F539 
        foreign key (SPONSOR_T) 
        references ctx_data_types (id);

    alter table aud_AUTH_GROUP_AUTHORITY 
        add index FK36C6EEDB3C81FA73 (REV), 
        add constraint FK36C6EEDB3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_AUTH_USER_GROUP 
        add index FK3F1258533C81FA73 (REV), 
        add constraint FK3F1258533C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_AUX_IDENTIFIERS 
        add index FK74E874203C81FA73 (REV), 
        add constraint FK74E874203C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_AUX_PROGRAMS 
        add index FK9C77DAD93C81FA73 (REV), 
        add constraint FK9C77DAD93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_auth_authorities 
        add index FK4878B0B93C81FA73 (REV), 
        add constraint FK4878B0B93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_auth_groups 
        add index FK16FE1D3C3C81FA73 (REV), 
        add constraint FK16FE1D3C3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_auth_users 
        add index FK649C3DA03C81FA73 (REV), 
        add constraint FK649C3DA03C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_ctd_countries 
        add index FK6D6BB4393C81FA73 (REV), 
        add constraint FK6D6BB4393C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_ctd_regions 
        add index FK4A5B6EC43C81FA73 (REV), 
        add constraint FK4A5B6EC43C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_ctx_data_types 
        add index FK7732C62B3C81FA73 (REV), 
        add constraint FK7732C62B3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_drd_organizational_units 
        add index FKE8A152463C81FA73 (REV), 
        add constraint FKE8A152463C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_addresses 
        add index FKC94BEC353C81FA73 (REV), 
        add constraint FKC94BEC353C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_contact_emails 
        add index FKDD2810A33C81FA73 (REV), 
        add constraint FKDD2810A33C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_contact_phones 
        add index FKEFAD59113C81FA73 (REV), 
        add constraint FKEFAD59113C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_disclosure 
        add index FK2AD20BBA3C81FA73 (REV), 
        add constraint FK2AD20BBA3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_disclosure_address 
        add index FK2B76F46F3C81FA73 (REV), 
        add constraint FK2B76F46F3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_disclosure_email 
        add index FK410386D73C81FA73 (REV), 
        add constraint FK410386D73C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_disclosure_phone 
        add index FK419C78A93C81FA73 (REV), 
        add constraint FK419C78A93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_disclosure_url 
        add index FK173E936A3C81FA73 (REV), 
        add constraint FK173E936A3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_emails 
        add index FK3FD4B8A43C81FA73 (REV), 
        add constraint FK3FD4B8A43C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_identifiers 
        add index FK499E80BD3C81FA73 (REV), 
        add constraint FK499E80BD3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_leaves_of_absence 
        add index FK90A030EB3C81FA73 (REV), 
        add constraint FK90A030EB3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_names 
        add index FKF204895B3C81FA73 (REV), 
        add constraint FKF204895B3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_persons 
        add index FKF3F449113C81FA73 (REV), 
        add constraint FKF3F449113C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_phones 
        add index FK525A01123C81FA73 (REV), 
        add constraint FK525A01123C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_role_records 
        add index FK6178D2063C81FA73 (REV), 
        add constraint FK6178D2063C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prc_urls 
        add index FK185628713C81FA73 (REV), 
        add constraint FK185628713C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prd_campuses 
        add index FK5C265FF93C81FA73 (REV), 
        add constraint FK5C265FF93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prd_identifier_types 
        add index FK6101BB8F3C81FA73 (REV), 
        add constraint FK6101BB8F3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prd_system_of_record 
        add index FKC7035FD53C81FA73 (REV), 
        add constraint FKC7035FD53C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_addresses 
        add index FK179718453C81FA73 (REV), 
        add constraint FK179718453C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_disclosure 
        add index FKA5EC61AA3C81FA73 (REV), 
        add constraint FKA5EC61AA3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_emails 
        add index FKBDE786943C81FA73 (REV), 
        add constraint FKBDE786943C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_leaves_of_absence 
        add index FK6B464CFB3C81FA73 (REV), 
        add constraint FK6B464CFB3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_names 
        add index FK40683D6B3C81FA73 (REV), 
        add constraint FK40683D6B3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_phones 
        add index FKD06CCF023C81FA73 (REV), 
        add constraint FKD06CCF023C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_role_records 
        add index FK7F556BF63C81FA73 (REV), 
        add constraint FK7F556BF63C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_sor_persons 
        add index FK196F3DF83C81FA73 (REV), 
        add constraint FK196F3DF83C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_sor_persons_loc_attr 
        add index FKB11B21F73C81FA73 (REV), 
        add constraint FKB11B21F73C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    alter table aud_prs_urls 
        add index FK33A3B2613C81FA73 (REV), 
        add constraint FK33A3B2613C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity (id);

    create index AUTH_AUTHORITY_NAME_IDX on auth_authorities (AUTHORITY_NAME);

    create index AUTH_GROUP_NAME_IDX on auth_groups (GROUP_NAME);

    create index AUTH_USERS_NAME_IDX on auth_users (USER_NAME);

    create index COUNTRY_CODE_INDEX on ctd_countries (code);

    create index COUNTRY_NAME_INDEX on ctd_countries (name);

    create index REGION_COUNTRY_CODE_INDEX on ctd_regions (code, country_id);

    alter table ctd_regions 
        add index FKFDC01DD33AAF30A (country_id), 
        add constraint FKFDC01DD33AAF30A 
        foreign key (country_id) 
        references ctd_countries (id);

    create index TYPE_INDEX on ctx_data_types (data_type);

    alter table drd_organizational_units 
        add index FKB08FD397919104A (campus_id), 
        add constraint FKB08FD397919104A 
        foreign key (campus_id) 
        references prd_campuses (id);

    alter table drd_organizational_units 
        add index FKB08FD39773ABFE4 (organizational_unit_t), 
        add constraint FKB08FD39773ABFE4 
        foreign key (organizational_unit_t) 
        references ctx_data_types (id);

    alter table drd_organizational_units 
        add index FKB08FD39749A1A6FC (parent_organizational_unit_id), 
        add constraint FKB08FD39749A1A6FC 
        foreign key (parent_organizational_unit_id) 
        references drd_organizational_units (id);

    create index PRC_ADDRESSES_COUNTRY_ID_IDX on prc_addresses (country_id);

    create index PRC_ADDRESSES_REGION_ID_IDX on prc_addresses (region_id);

    create index ADDRESS_INDEX on prc_addresses (line1, city, postal_code);

    alter table prc_addresses 
        add index FK3641138460051F26 (role_record_id), 
        add constraint FK3641138460051F26 
        foreign key (role_record_id) 
        references prc_role_records (id);

    alter table prc_addresses 
        add index FK364113843AAF30A (country_id), 
        add constraint FK364113843AAF30A 
        foreign key (country_id) 
        references ctd_countries (id);

    alter table prc_addresses 
        add index FK36411384C43B49AA (region_id), 
        add constraint FK36411384C43B49AA 
        foreign key (region_id) 
        references ctd_regions (id);

    alter table prc_addresses 
        add index FK364113849C806F93 (address_t), 
        add constraint FK364113849C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    create index CONTACT_EMAIL_ADDRESS_INDEX on prc_contact_emails (address);

    create index PRC_CONTACT_EMAILS_EM_ADD_IDX on prc_contact_emails (email_address_t);

    alter table prc_contact_emails 
        add index FK552222B43ABEE2B0 (email_address_t), 
        add constraint FK552222B43ABEE2B0 
        foreign key (email_address_t) 
        references ctx_data_types (id);

    create index CONTACT_PHONE_INDEX on prc_contact_phones (country_code, area_code, phone_number);

    create index PRC_CONTACT_PHONES_PHONE_T_IDX on prc_contact_phones (phone_t);

    create index PRC_CONTACT_PHONES_ADDR_T_IDX on prc_contact_phones (address_t);

    alter table prc_contact_phones 
        add index FK67A76B2244E19A8D (phone_t), 
        add constraint FK67A76B2244E19A8D 
        foreign key (phone_t) 
        references ctx_data_types (id);

    alter table prc_contact_phones 
        add index FK67A76B229C806F93 (address_t), 
        add constraint FK67A76B229C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    alter table prc_disclosure 
        add index FK5C81CE4B91BFC98A (person_id), 
        add constraint FK5C81CE4B91BFC98A 
        foreign key (person_id) 
        references prc_persons (id);

    alter table prc_disclosure_address 
        add index FK15079600AED9AB97 (disclosure_record_id), 
        add constraint FK15079600AED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure (id);

    alter table prc_disclosure_address 
        add index FK150796005D70878F (affiliation_t), 
        add constraint FK150796005D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_address 
        add index FK150796009C806F93 (address_t), 
        add constraint FK150796009C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_email 
        add index FKA2C158A8AED9AB97 (disclosure_record_id), 
        add constraint FKA2C158A8AED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure (id);

    alter table prc_disclosure_email 
        add index FKA2C158A85D70878F (affiliation_t), 
        add constraint FKA2C158A85D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_email 
        add index FKA2C158A89C806F93 (address_t), 
        add constraint FKA2C158A89C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_phone 
        add index FKA35A4A7AAED9AB97 (disclosure_record_id), 
        add constraint FKA35A4A7AAED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure (id);

    alter table prc_disclosure_phone 
        add index FKA35A4A7A5D70878F (affiliation_t), 
        add constraint FKA35A4A7A5D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_phone 
        add index FKA35A4A7A44E19A8D (phone_t), 
        add constraint FKA35A4A7A44E19A8D 
        foreign key (phone_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_phone 
        add index FKA35A4A7A9C806F93 (address_t), 
        add constraint FKA35A4A7A9C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_url 
        add index FK8F38A57BAED9AB97 (disclosure_record_id), 
        add constraint FK8F38A57BAED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure (id);

    alter table prc_disclosure_url 
        add index FK8F38A57B5D70878F (affiliation_t), 
        add constraint FK8F38A57B5D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types (id);

    alter table prc_disclosure_url 
        add index FK8F38A57B9C806F93 (address_t), 
        add constraint FK8F38A57B9C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    create index EMAIL_ADDRESS_INDEX on prc_emails (address);

    alter table prc_emails 
        add index FK66A66BB560051F26 (role_record_id), 
        add constraint FK66A66BB560051F26 
        foreign key (role_record_id) 
        references prc_role_records (id);

    alter table prc_emails 
        add index FK66A66BB59C806F93 (address_t), 
        add constraint FK66A66BB59C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    create index ID_ID_TYPE_INDEX on prc_identifiers (identifier, identifier_t);

    create index PRC_IDENTIF_PERSON_IDX on prc_identifiers (person_id);

    create index ID_IDENTIFIER_INDEX on prc_identifiers (identifier);

    alter table prc_identifiers 
        add index FK4DE7104C4CBB02D1 (identifier_t), 
        add constraint FK4DE7104C4CBB02D1 
        foreign key (identifier_t) 
        references prd_identifier_types (identifier_t);

    alter table prc_identifiers 
        add index FK4DE7104C91BFC98A (person_id), 
        add constraint FK4DE7104C91BFC98A 
        foreign key (person_id) 
        references prc_persons (id);

    create index PRC_LEAVE_OF_ABS_ROLE_REC_IDX on prc_leaves_of_absence (role_record_id);

    create index PRC_LEAVE_OF_ABSENCE_LEAVE_IDX on prc_leaves_of_absence (leave_t);

    alter table prc_leaves_of_absence 
        add index FK669C993A60051F26 (role_record_id), 
        add constraint FK669C993A60051F26 
        foreign key (role_record_id) 
        references prc_role_records (id);

    alter table prc_leaves_of_absence 
        add index FK669C993A6B687D96 (leave_t), 
        add constraint FK669C993A6B687D96 
        foreign key (leave_t) 
        references ctx_data_types (id);

    create index PRC_NAMES_NAME_T_IDX on prc_names (name_t);

    create index PRC_NAMES_PERSON_ID_IDX on prc_names (person_id);

    create index NAME_GIVEN_FAMILY_INDEX on prc_names (given_name, family_name);

    create index PRC_NAMES_OFF_NAME_IDX on prc_names (is_official_name);

    create index PRC_NAMES_PREF_NAME_IDX on prc_names (is_preferred_name);

    create index NAME_FAMILY_INDEX on prc_names (family_name);

    create index NAME_GIVEN_INDEX on prc_names (given_name);

    alter table prc_names 
        add index FK3D97B02A299F046A (name_t), 
        add constraint FK3D97B02A299F046A 
        foreign key (name_t) 
        references ctx_data_types (id);

    alter table prc_names 
        add index FK3D97B02A91BFC98A (person_id), 
        add constraint FK3D97B02A91BFC98A 
        foreign key (person_id) 
        references prc_persons (id);

    create index PRC_PERSONS_CONTACT_PHONE_IDX on prc_persons (contact_phone_id);

    create index PRC_PERSONS_CONTACT_EMAIL_IDX on prc_persons (contact_email_id);

    alter table prc_persons 
        add index FKA758F820A2BC9F69 (contact_phone_id), 
        add constraint FKA758F820A2BC9F69 
        foreign key (contact_phone_id) 
        references prc_contact_phones (id);

    alter table prc_persons 
        add index FKA758F8203B0602E5 (contact_email_id), 
        add constraint FKA758F8203B0602E5 
        foreign key (contact_email_id) 
        references prc_contact_emails (id);

    create index PHONE_INDEX on prc_phones (country_code, area_code, phone_number);

    alter table prc_phones 
        add index FK792BB42360051F26 (role_record_id), 
        add constraint FK792BB42360051F26 
        foreign key (role_record_id) 
        references prc_role_records (id);

    alter table prc_phones 
        add index FK792BB42344E19A8D (phone_t), 
        add constraint FK792BB42344E19A8D 
        foreign key (phone_t) 
        references ctx_data_types (id);

    alter table prc_phones 
        add index FK792BB4239C806F93 (address_t), 
        add constraint FK792BB4239C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    create index PRC_ROLE_RECORDS_PRS_STAT_IDX on prc_role_records (person_status_t);

    create index PRC_ROLE_RECORDS_SPONSOR_IDX on prc_role_records (sponsor_t);

    create index PRC_ROLE_REC_PRS_ROLE_REC_IDX on prc_role_records (prs_role_id);

    create index PRC_ROLE_RECORDS_TERM_IDX on prc_role_records (termination_t);

    alter table prc_role_records 
        add index FKE642345727B2F539 (sponsor_t), 
        add constraint FKE642345727B2F539 
        foreign key (sponsor_t) 
        references ctx_data_types (id);

    alter table prc_role_records 
        add index FKE64234575D70878F (affiliation_t), 
        add constraint FKE64234575D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types (id);

    alter table prc_role_records 
        add index FKE64234575ABC21BB (person_status_t), 
        add constraint FKE64234575ABC21BB 
        foreign key (person_status_t) 
        references ctx_data_types (id);

    alter table prc_role_records 
        add index FKE642345730C4EFC7 (organizational_unit_id), 
        add constraint FKE642345730C4EFC7 
        foreign key (organizational_unit_id) 
        references drd_organizational_units (id);

    alter table prc_role_records 
        add index FKE642345791BFC98A (person_id), 
        add constraint FKE642345791BFC98A 
        foreign key (person_id) 
        references prc_persons (id);

    alter table prc_role_records 
        add index FKE64234571FEF16A3 (termination_t), 
        add constraint FKE64234571FEF16A3 
        foreign key (termination_t) 
        references ctx_data_types (id);

    create index PRC_URLS_ADDRESS_T_IDX on prc_urls (address_t);

    create index PRC_URLS_ROLE_RECORD_ID_IDX on prc_urls (role_record_id);

    alter table prc_urls 
        add index FKAF6B6BC260051F26 (role_record_id), 
        add constraint FKAF6B6BC260051F26 
        foreign key (role_record_id) 
        references prc_role_records (id);

    alter table prc_urls 
        add index FKAF6B6BC29C806F93 (address_t), 
        add constraint FKAF6B6BC29C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    create index PRS_ADDRESSES_REGION_ID_IDX on prs_addresses (region_id);

    create index PRS_ADDRESS_ROLE_INDEX on prs_addresses (role_record_id);

    create index PRS_ADDRESSES_COUNTRY_ID_IDX on prs_addresses (country_id);

    alter table prs_addresses 
        add index FK848C3F94F396A254 (role_record_id), 
        add constraint FK848C3F94F396A254 
        foreign key (role_record_id) 
        references prs_role_records (record_id);

    alter table prs_addresses 
        add index FK848C3F943AAF30A (country_id), 
        add constraint FK848C3F943AAF30A 
        foreign key (country_id) 
        references ctd_countries (id);

    alter table prs_addresses 
        add index FK848C3F94C43B49AA (region_id), 
        add constraint FK848C3F94C43B49AA 
        foreign key (region_id) 
        references ctd_regions (id);

    alter table prs_addresses 
        add index FK848C3F949C806F93 (address_t), 
        add constraint FK848C3F949C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    alter table prs_disclosure 
        add index FKD79C243BF6F86DCF (sor_person_id), 
        add constraint FKD79C243BF6F86DCF 
        foreign key (sor_person_id) 
        references prs_sor_persons (record_id);

    create index PRS_EMAIL_ROLE_INDEX on prs_emails (role_record_id);

    alter table prs_emails 
        add index FKE4B939A5F396A254 (role_record_id), 
        add constraint FKE4B939A5F396A254 
        foreign key (role_record_id) 
        references prs_role_records (record_id);

    alter table prs_emails 
        add index FKE4B939A59C806F93 (address_t), 
        add constraint FKE4B939A59C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    create index PRS_LEAV_ABSENCE_LEAVE_T_IDX on prs_leaves_of_absence (leave_t);

    create index PRS_LOA_ROLE_INDEX on prs_leaves_of_absence (role_record_id);

    alter table prs_leaves_of_absence 
        add index FK4142B54AF396A254 (role_record_id), 
        add constraint FK4142B54AF396A254 
        foreign key (role_record_id) 
        references prs_role_records (record_id);

    alter table prs_leaves_of_absence 
        add index FK4142B54A6B687D96 (leave_t), 
        add constraint FK4142B54A6B687D96 
        foreign key (leave_t) 
        references ctx_data_types (id);

    create index PRS_NAMES_NAME_T_IDX on prs_names (name_t);

    create index PRS_NAME_PERSON_INDEX on prs_names (sor_person_id);

    alter table prs_names 
        add index FK8BFB643A299F046A (name_t), 
        add constraint FK8BFB643A299F046A 
        foreign key (name_t) 
        references ctx_data_types (id);

    alter table prs_names 
        add index FK8BFB643AF6F86DCF (sor_person_id), 
        add constraint FK8BFB643AF6F86DCF 
        foreign key (sor_person_id) 
        references prs_sor_persons (record_id);

    create index PRS_PHONE_ROLE_INDEX on prs_phones (role_record_id);

    alter table prs_phones 
        add index FKF73E8213F396A254 (role_record_id), 
        add constraint FKF73E8213F396A254 
        foreign key (role_record_id) 
        references prs_role_records (record_id);

    alter table prs_phones 
        add index FKF73E821344E19A8D (phone_t), 
        add constraint FKF73E821344E19A8D 
        foreign key (phone_t) 
        references ctx_data_types (id);

    alter table prs_phones 
        add index FKF73E82139C806F93 (address_t), 
        add constraint FKF73E82139C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);

    create index PRS_ROLE_REC_PERS_STAT_T_IDX on prs_role_records (person_status_t);

    create index PRS_ROLE_RECORDS_SPONSOR_T_IDX on prs_role_records (sponsor_t);

    create index PRS_ROLE_REC_ORG_UNIT_ID_IDX on prs_role_records (organizational_unit_id);

    create index PRS_ROLE_SOR_PERSON_INDEX on prs_role_records (sor_person_id);

    create index PRS_ROLE_REC_TERM_T_IDX on prs_role_records (termination_t);

    alter table prs_role_records 
        add index FK41ECE4727B2F539 (sponsor_t), 
        add constraint FK41ECE4727B2F539 
        foreign key (sponsor_t) 
        references ctx_data_types (id);

    alter table prs_role_records 
        add index FK41ECE475D70878F (affiliation_t), 
        add constraint FK41ECE475D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types (id);

    alter table prs_role_records 
        add index FK41ECE475ABC21BB (person_status_t), 
        add constraint FK41ECE475ABC21BB 
        foreign key (person_status_t) 
        references ctx_data_types (id);

    alter table prs_role_records 
        add index FK41ECE4730C4EFC7 (organizational_unit_id), 
        add constraint FK41ECE4730C4EFC7 
        foreign key (organizational_unit_id) 
        references drd_organizational_units (id);

    alter table prs_role_records 
        add index FK41ECE47F6F86DCF (sor_person_id), 
        add constraint FK41ECE47F6F86DCF 
        foreign key (sor_person_id) 
        references prs_sor_persons (record_id);

    alter table prs_role_records 
        add index FK41ECE471FEF16A3 (termination_t), 
        add constraint FK41ECE471FEF16A3 
        foreign key (termination_t) 
        references ctx_data_types (id);

    alter table prs_role_records 
        add index FK41ECE4796BAEDE0 (system_of_record_id), 
        add constraint FK41ECE4796BAEDE0 
        foreign key (system_of_record_id) 
        references prd_system_of_record (id);

    create index SOR_PERSON_SOURCE_AND_ID_INDEX on prs_sor_persons (source_sor_id, id);

    alter table prs_sor_persons_loc_attr 
        add index FK7909A348167CE9DB (sor_person_record_id), 
        add constraint FK7909A348167CE9DB 
        foreign key (sor_person_record_id) 
        references prs_sor_persons (record_id);

    create index PRS_URL_ROLE_INDEX on prs_urls (role_record_id);

    create index PRS_URLS_ADDRESS_T_IDX on prs_urls (address_t);

    alter table prs_urls 
        add index FKCAB8F5B2F396A254 (role_record_id), 
        add constraint FKCAB8F5B2F396A254 
        foreign key (role_record_id) 
        references prs_role_records (record_id);

    alter table prs_urls 
        add index FKCAB8F5B29C806F93 (address_t), 
        add constraint FKCAB8F5B29C806F93 
        foreign key (address_t) 
        references ctx_data_types (id);
