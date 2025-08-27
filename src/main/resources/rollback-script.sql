--  *********************************************************************
--  SQL to roll back currently unexecuted changes
--  *********************************************************************
--  Change Log: db-changelog.xml
--  Ran at: 27.08.2025, 10:51
--  Against: webuser@localhost@jdbc:mysql://localhost:3306/dating
--  Liquibase version: 4.33.0
--  *********************************************************************

--  Lock Database
UPDATE dating.databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'XWPF3SETM3 (192.168.2.176)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;

--  Rolling Back ChangeSet: db-changelog.xml::Add PRO_GENDER column::Caleb
ALTER TABLE dating.PROFILES DROP COLUMN PRO_GENDER;

DELETE FROM dating.databasechangelog WHERE ID = 'Add PRO_GENDER column' AND AUTHOR = 'Caleb' AND FILENAME = 'db-changelog.xml';

--  Rolling Back ChangeSet: db-changelog.xml::Create FK_PRO_BRE_ID::Caleb
ALTER TABLE dating.PROFILES DROP FOREIGN KEY FK_PRO_BRE_ID;

DELETE FROM dating.databasechangelog WHERE ID = 'Create FK_PRO_BRE_ID' AND AUTHOR = 'Caleb' AND FILENAME = 'db-changelog.xml';

--  Rolling Back ChangeSet: db-changelog.xml::Create IX_PRO_BRE_ID::Caleb
DROP INDEX IX_PRO_BRE_ID ON dating.PROFILES;

DELETE FROM dating.databasechangelog WHERE ID = 'Create IX_PRO_BRE_ID' AND AUTHOR = 'Caleb' AND FILENAME = 'db-changelog.xml';

--  Rolling Back ChangeSet: db-changelog.xml::Create PROFILES table::Caleb
DROP TABLE dating.PROFILES;

DELETE FROM dating.databasechangelog WHERE ID = 'Create PROFILES table' AND AUTHOR = 'Caleb' AND FILENAME = 'db-changelog.xml';

--  Release Database Lock
UPDATE dating.databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

