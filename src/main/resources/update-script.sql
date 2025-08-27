--  Lock Database
UPDATE dating.databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'XWPF3SETM3 (192.168.2.176)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;

--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: db-changelog.xml
--  Ran at: 27.08.2025, 10:45
--  Against: webuser@localhost@jdbc:mysql://localhost:3306/dating
--  Liquibase version: 4.33.0
--  *********************************************************************

--  Changeset db-changelog.xml::Create PROFILES table::Caleb
CREATE TABLE dating.PROFILES (PRO_ID INT AUTO_INCREMENT NOT NULL, PRO_NAME VARCHAR(100) NOT NULL, PRO_BRE_ID INT NULL, PRO_HEIGHT INT NULL, PRO_WEIGHT INT NULL, PRO_DESCRIPTION VARCHAR(4000) NULL, PRO_IMAGE_URL VARCHAR(100) NULL, CONSTRAINT PK_PROFILES PRIMARY KEY (PRO_ID));

INSERT INTO dating.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('Create PROFILES table', 'Caleb', 'db-changelog.xml', NOW(), 3, '9:275b2d45572aefe0bc3df47d34a222ed', 'createTable tableName=PROFILES', '', 'EXECUTED', NULL, NULL, '4.33.0', '6284315878');

--  Changeset db-changelog.xml::Create IX_PRO_BRE_ID::Caleb
CREATE INDEX IX_PRO_BRE_ID ON dating.PROFILES(PRO_BRE_ID);

INSERT INTO dating.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('Create IX_PRO_BRE_ID', 'Caleb', 'db-changelog.xml', NOW(), 4, '9:58cdb0b25791d46fd9cda5246e064ba0', 'createIndex indexName=IX_PRO_BRE_ID, tableName=PROFILES', '', 'EXECUTED', NULL, NULL, '4.33.0', '6284315878');

--  Changeset db-changelog.xml::Create FK_PRO_BRE_ID::Caleb
ALTER TABLE dating.PROFILES ADD CONSTRAINT FK_PRO_BRE_ID FOREIGN KEY (PRO_BRE_ID) REFERENCES dating.BREEDS (BRE_ID);

INSERT INTO dating.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('Create FK_PRO_BRE_ID', 'Caleb', 'db-changelog.xml', NOW(), 5, '9:d5a014e54263a1a0541c3d63cf6798ba', 'addForeignKeyConstraint baseTableName=PROFILES, constraintName=FK_PRO_BRE_ID, referencedTableName=BREEDS', '', 'EXECUTED', NULL, NULL, '4.33.0', '6284315878');

--  Changeset db-changelog.xml::Add PRO_GENDER column::Caleb
ALTER TABLE dating.PROFILES ADD PRO_GENDER CHAR(1) NULL;

INSERT INTO dating.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('Add PRO_GENDER column', 'Caleb', 'db-changelog.xml', NOW(), 6, '9:531a7c7cf534a1bbb245d2ad63d0b5d4', 'addColumn tableName=PROFILES', '', 'EXECUTED', NULL, NULL, '4.33.0', '6284315878');

--  Release Database Lock
UPDATE dating.databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

