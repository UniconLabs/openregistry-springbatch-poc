-- Campuses

INSERT INTO prd_campuses (code, name)
  VALUES ('01', 'UTAH CAMPUS1');

INSERT INTO prd_campuses (code, name)
  VALUES ('02', 'UTAH CAMPUS2');


-- Identifiers

INSERT INTO prd_identifier_types (name)
  VALUES ('SSN');

INSERT INTO prd_identifier_types (name)
  VALUES ('UTAHID');

INSERT INTO prd_identifier_types (name)
  VALUES ('NETID');


-- Example Data Types

INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('AFFILIATION', 'Faculty');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('AFFILIATION', 'Staff');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('AFFILIATION', 'Student');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('ORGANIZATIONAL_UNIT', 'Mathematics');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('ORGANIZATIONAL_UNIT', 'Biology');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('ORGANIZATIONAL_UNIT', 'Psychology');
 
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('ORGANIZATIONAL_UNIT', 'Computer Science');
 
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('STATUS', 'Active');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('STATUS', 'InActive');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('PHONE', 'Cell');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('PHONE', 'Land');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('PHONE', 'Other');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('ADDRESS', 'Home');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('ADDRESS', 'Campus');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('EMAIL', 'Home');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('EMAIL', 'Campus');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('URL', 'Personal');
 
INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('SPONSOR', 'Person');

INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('NAME', 'Formal');

INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('NAME', 'Formerly Known As');

INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('NAME', 'Maiden');

INSERT INTO CTX_DATA_TYPES (data_type, description)
VALUES ('NAME', 'Nickname');

INSERT INTO prd_system_of_record (sor_id)
VALUES ('PEOPLESOFT');

-- Example Organizational Units and Roles

INSERT INTO drd_organizational_units
 (code, name, campus_id, organizational_unit_t)
(SELECT 'CSI', 'Computer Science',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '02'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Computer Science');
 
INSERT INTO drd_organizational_units
 (code, name, campus_id, organizational_unit_t)
(SELECT 'MATH', 'Mathematics',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '02'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Mathematics');
