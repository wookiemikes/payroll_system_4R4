# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases v6.2.1                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          Payroll.dez                                     #
# Project name:                                                          #
# Author:                                                                #
# Script type:           Database creation script                        #
# Created on:            2019-12-02 15:15                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "tblutilincometype"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutilincometype` (
    `incometypeid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `incometypecode` VARCHAR(30),
    `incometypename` VARCHAR(75),
    PRIMARY KEY (`incometypeid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblsecgroup"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblsecgroup` (
    `groupid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `groupname` VARCHAR(75),
    `status` TINYINT(4) DEFAULT 1 COMMENT '1-Active,0-Inactive',
    PRIMARY KEY (`groupid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblsecgrouppriv"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblsecgrouppriv` (
    `grpprivid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `groupid` INTEGER(11),
    `privid` INTEGER(11),
    `moduleid` INTEGER(11),
    `dateadded` DATETIME,
    PRIMARY KEY (`grpprivid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblsecgroupusers"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblsecgroupusers` (
    `grpuserid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `useracctid` INTEGER(11),
    `groupid` INTEGER(11),
    `dateadded` DATETIME,
    PRIMARY KEY (`grpuserid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblsecmodules"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblsecmodules` (
    `moduleid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `modulename` VARCHAR(75),
    PRIMARY KEY (`moduleid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblsecprivileges"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblsecprivileges` (
    `privid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `privilegename` VARCHAR(75),
    PRIMARY KEY (`privid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblsecuseracct"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblsecuseracct` (
    `useracctid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20),
    `password` VARCHAR(20),
    `status` TINYINT(1) DEFAULT 1 COMMENT '1-Active, Inactive',
    PRIMARY KEY (`useracctid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutilarea"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutilarea` (
    `areaid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `areaname` VARCHAR(75),
    PRIMARY KEY (`areaid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildeductionnames"                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildeductionnames` (
    `deductionnamesid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `deductiontypeid` INTEGER(11),
    `deductionnamecode` VARCHAR(30),
    PRIMARY KEY (`deductionnamesid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildeductiontype"                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildeductiontype` (
    `deductiontypeid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `deductiontypecode` VARCHAR(30),
    `deductiontypename` VARCHAR(75),
    PRIMARY KEY (`deductiontypeid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildepartment"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildepartment` (
    `departmentid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `departmentname` VARCHAR(75),
    PRIMARY KEY (`departmentid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildivareasecdep"                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildivareasecdep` (
    `divareasecdepid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `divareasecid` INTEGER(11),
    `departmentid` INTEGER(11),
    PRIMARY KEY (`divareasecdepid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildivareasecdepgroup"                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildivareasecdepgroup` (
    `divareasecdepgroupid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `groupteamid` INTEGER(11),
    `divareasecdepid` INTEGER(11),
    PRIMARY KEY (`divareasecdepgroupid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildivision"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildivision` (
    `divid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `divname` VARCHAR(75),
    PRIMARY KEY (`divid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildivisionarea"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildivisionarea` (
    `divareaid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `divid` INTEGER(11),
    `areaid` INTEGER(11),
    PRIMARY KEY (`divareaid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutildivisionareasection"                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutildivisionareasection` (
    `divareasecid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `divareaid` INTEGER(11),
    `sectionid` INTEGER(11),
    PRIMARY KEY (`divareasecid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutilgroupteam"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutilgroupteam` (
    `groupteamid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `groupteamname` VARCHAR(75),
    PRIMARY KEY (`groupteamid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutiljoblevel"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutiljoblevel` (
    `joblevelid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `joblevelcode` VARCHAR(50),
    `joblevelname` VARCHAR(75),
    PRIMARY KEY (`joblevelid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutiljobstatus"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutiljobstatus` (
    `jobstatusid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `jobstatuscode` VARCHAR(50),
    `jobstatusname` VARCHAR(75),
    PRIMARY KEY (`jobstatusid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutilleavetype"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutilleavetype` (
    `leavetypeid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `leavetypecode` VARCHAR(30),
    `leavetypename` VARCHAR(75),
    PRIMARY KEY (`leavetypeid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutilposition"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutilposition` (
    `positionid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `positioncode` VARCHAR(30),
    `positionname` VARCHAR(75),
    PRIMARY KEY (`positionid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblutilsection"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutilsection` (
    `sectionid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `sectionname` VARCHAR(75),
    PRIMARY KEY (`sectionid`)
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# ---------------------------------------------------------------------- #
# Add table "tblemployeeinfo"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeeinfo` (
    `employeeid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `useracctid` INTEGER(11),
    `joblevelid` INTEGER(11),
    `jobstatusid` INTEGER(11),
    `firstname` VARCHAR(75),
    `lastname` VARCHAR(75),
    `middlename` VARCHAR(75),
    `extension` VARCHAR(40),
    `maiden` VARCHAR(95),
    `gender` VARCHAR(15),
    `civilstat` VARCHAR(20),
    `bday` DATE,
    `bloodtype` VARCHAR(20),
    `nationality` VARCHAR(40),
    `religion` VARCHAR(40),
    `height` VARCHAR(20),
    `placeofbirth` VARCHAR(95),
    `remarks` VARCHAR(75),
    CONSTRAINT `PK_tblemployeeinfo` PRIMARY KEY (`employeeid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeeids"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeeids` (
    `idno` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `employeeid` INTEGER(11),
    `badgeno` VARCHAR(40),
    `philidno` VARCHAR(40),
    `sssno` VARCHAR(40),
    `tinno` VARCHAR(40),
    `hdmfno` VARCHAR(40),
    `philheathno` VARCHAR(40),
    `gsisno` VARCHAR(40),
    `agencyno` VARCHAR(40),
    `medicareno` VARCHAR(40),
    `passportno` VARCHAR(40),
    CONSTRAINT `PK_tblemployeeids` PRIMARY KEY (`idno`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeeposition"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeeposition` (
    `empposid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `datefrom` DATE,
    `dateto` DATE,
    `areaid` INTEGER(11),
    `divid` INTEGER(11),
    `sectionid` INTEGER(11),
    `departmentid` INTEGER(11),
    `employeeid` INTEGER(11),
    `positionid` INTEGER(11),
    CONSTRAINT `PK_tblemployeeposition` PRIMARY KEY (`empposid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeespouse"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeespouse` (
    `empspouseid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `employeeid` INTEGER(11),
    `lastname` VARCHAR(75),
    `firstname` VARCHAR(75),
    `middlename` VARCHAR(75),
    `contactno` VARCHAR(40),
    `occupation` VARCHAR(75),
    `employername` VARCHAR(125),
    `employeraddress` VARCHAR(75),
    CONSTRAINT `PK_tblemployeespouse` PRIMARY KEY (`empspouseid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeeparents"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeeparents` (
    `empparentid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `mothermaidenname` VARCHAR(100),
    `motherlastname` VARCHAR(75),
    `motherfirstname` VARCHAR(75),
    `mothermiddlename` VARCHAR(75),
    `motheroccupation` VARCHAR(75),
    `motherbday` DATE,
    `fatherlastname` VARCHAR(75),
    `fatherfirstname` VARCHAR(75),
    `fathermiddlename` VARCHAR(75),
    `fatheroccupation` VARCHAR(75),
    `fatherbday` DATE,
    `employeeid` INTEGER(11),
    CONSTRAINT `PK_tblemployeeparents` PRIMARY KEY (`empparentid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeeparentsinlaw"                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeeparentsinlaw` (
    `empparentlawid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `mothermaidenname` VARCHAR(100),
    `motherlastname` VARCHAR(75),
    `motherfirstname` VARCHAR(75),
    `mothermiddlename` VARCHAR(75),
    `motheroccupation` VARCHAR(75),
    `motherbday` DATE,
    `fatherlastname` VARCHAR(75),
    `fatherfirstname` VARCHAR(75),
    `fathermiddlename` VARCHAR(75),
    `fatheroccupation` VARCHAR(75),
    `fatherbday` DATE,
    `employeeid` INTEGER(11),
    CONSTRAINT `PK_tblemployeeparentsinlaw` PRIMARY KEY (`empparentlawid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblutilrelationship"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblutilrelationship` (
    `relationshipid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `relationshipname` VARCHAR(100),
    CONSTRAINT `PK_tblutilrelationship` PRIMARY KEY (`relationshipid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeechildren"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeechildren` (
    `childrenid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `lastname` VARCHAR(75),
    `firstname` VARCHAR(75),
    `middlename` VARCHAR(75),
    `bday` VARCHAR(75),
    `relationshipid` INTEGER(11),
    `employeeid` INTEGER(11),
    CONSTRAINT `PK_tblemployeechildren` PRIMARY KEY (`childrenid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeesiblings"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeesiblings` (
    `childrenid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `lastname` VARCHAR(75),
    `firstname` VARCHAR(75),
    `middlename` VARCHAR(75),
    `bday` VARCHAR(75),
    `relationshipid` INTEGER(11),
    `employeeid` INTEGER(11),
    CONSTRAINT `PK_tblemployeesiblings` PRIMARY KEY (`childrenid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeereferences"                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeereferences` (
    `emprefid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `positionid` INTEGER(11),
    `employeeid` INTEGER(11),
    `fullname` VARCHAR(75),
    `address` VARCHAR(125),
    `contact` VARCHAR(40),
    CONSTRAINT `PK_tblemployeereferences` PRIMARY KEY (`emprefid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblimployeeincomeinfo"                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblimployeeincomeinfo` (
    `empincomeinfoid` INTEGER(11) NOT NULL,
    `incometypeid` INTEGER(11),
    `employeeid` INTEGER(11),
    `datestart` DATE,
    `dateend` DATE,
    `fixedornot` TINYINT(1),
    `amountiffix` DECIMAL(20,2),
    `taxableornot` TINYINT(1),
    `basictype` TINYINT(1),
    CONSTRAINT `PK_tblimployeeincomeinfo` PRIMARY KEY (`empincomeinfoid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeeleave"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeeleave` (
    `empempid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `employeeid` INTEGER(11),
    `leavetypeid` INTEGER(11),
    `datefrom` DATE,
    `dateto` DATE,
    `halfdayamleave` TINYINT(1),
    `halfdaypmleave` TINYINT(1),
    `datefiled` DATE,
    `dateapproved` DATE,
    `status` VARCHAR(40),
    CONSTRAINT `PK_tblemployeeleave` PRIMARY KEY (`empempid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeeovertime"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeeovertime` (
    `empotid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `employeeid` INTEGER(11),
    `otdate` DATE,
    `timefrom` TIME,
    `timeto` TIME,
    `datefiled` DATE,
    `dateapproved` DATE,
    `status` TINYINT(1),
    CONSTRAINT `PK_tblemployeeovertime` PRIMARY KEY (`empotid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeededuction"                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeededuction` (
    `empdeductid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `employeeid` INTEGER(11),
    `deductionnamesid` INTEGER(11),
    `payrollfrom` DATE,
    `payrollto` DATE,
    `deductperiod` TINYINT,
    CONSTRAINT `PK_tblemployeededuction` PRIMARY KEY (`empdeductid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeedtr"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeedtr` (
    `empdtrid` INTEGER(11) NOT NULL,
    `employeeid` INTEGER(11),
    `dtrdate` DATE,
    `timein_am` TIME,
    `timeout_am` TIME,
    `timein_pm` TIME,
    `timeout_pm` TIME,
    `timein_eve` TIME,
    `timeout_eve` TIME,
    CONSTRAINT `PK_tblemployeedtr` PRIMARY KEY (`empdtrid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeedtrcorrection"                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeedtrcorrection` (
    `empdtrcorrectid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `empdtrid` INTEGER(11),
    `correctiontimetype` TINYINT,
    `correctime` TIME,
    `reasonofcorrection` VARCHAR(125),
    `daterequest` DATE,
    `dateapproved` DATE,
    CONSTRAINT `PK_tblemployeedtrcorrection` PRIMARY KEY (`empdtrcorrectid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblpayrollheader"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblpayrollheader` (
    `payrollid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `periodfrom` DATE,
    `periodto` DATE,
    `cutoffdatefrom` DATE,
    `cutoffdateto` DATE,
    `preparedby` INTEGER(11),
    `posteddate` DATE,
    CONSTRAINT `PK_tblpayrollheader` PRIMARY KEY (`payrollid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblpayrollincome"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblpayrollincome` (
    `payempincomeid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `payrollid` INTEGER(11),
    `employeeid` INTEGER(11),
    `empincomeinfoid` INTEGER(11),
    `income_amount` DECIMAL(10,2),
    `total_present` DECIMAL(10,2),
    `total_absent` DECIMAL(10,2),
    CONSTRAINT `PK_tblpayrollincome` PRIMARY KEY (`payempincomeid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblpayrollot"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblpayrollot` (
    `payrollotid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `employeeid` INTEGER(11),
    `payrollid` INTEGER(11),
    `othours` DECIMAL(10,2),
    `otamount` DECIMAL(10,2),
    CONSTRAINT `PK_tblpayrollot` PRIMARY KEY (`payrollotid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblpayrolldeduction"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblpayrolldeduction` (
    `payrolldeductid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `payrollid` INTEGER(11),
    `empdeductid` INTEGER(11),
    `amount` DECIMAL(20,2),
    CONSTRAINT `PK_tblpayrolldeduction` PRIMARY KEY (`payrolldeductid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblmemo"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblmemo` (
    `memoid` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `applicableto` TINYINT(1),
    `memotitle` VARCHAR(125),
    `memosubject` VARCHAR(125),
    `memocontent` VARCHAR(125),
    `memoreleasedate` DATE,
    `employeeid` INTEGER(11),
    CONSTRAINT `PK_tblmemo` PRIMARY KEY (`memoid`)
);

# ---------------------------------------------------------------------- #
# Add table "tblemployeememoreceived"                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `tblemployeememoreceived` (
    `empmemoreceivedid` INTEGER(11) NOT NULL,
    `datereceived` DATETIME,
    `memoid` INTEGER(11),
    CONSTRAINT `PK_tblemployeememoreceived` PRIMARY KEY (`empmemoreceivedid`)
);

# ---------------------------------------------------------------------- #
# Foreign key constraints                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `tblsecgrouppriv` ADD CONSTRAINT `tblsecgrouppriv_ibfk_1` 
    FOREIGN KEY (`groupid`) REFERENCES `tblsecgroup` (`groupid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblsecgrouppriv` ADD CONSTRAINT `fkprivid` 
    FOREIGN KEY (`privid`) REFERENCES `tblsecprivileges` (`privid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblsecgrouppriv` ADD CONSTRAINT `tblsecgrouppriv_ibfk_2` 
    FOREIGN KEY (`moduleid`) REFERENCES `tblsecmodules` (`moduleid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblsecgroupusers` ADD CONSTRAINT `fkgroupid` 
    FOREIGN KEY (`groupid`) REFERENCES `tblsecgroup` (`groupid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblsecgroupusers` ADD CONSTRAINT `fkuseracctid` 
    FOREIGN KEY (`useracctid`) REFERENCES `tblsecuseracct` (`useracctid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildeductionnames` ADD CONSTRAINT `tblutildeductionnames_ibfk_1` 
    FOREIGN KEY (`deductiontypeid`) REFERENCES `tblutildeductiontype` (`deductiontypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivareasecdep` ADD CONSTRAINT `tblutildivareasecdep_ibfk_2` 
    FOREIGN KEY (`departmentid`) REFERENCES `tblutildepartment` (`departmentid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivareasecdep` ADD CONSTRAINT `tblutildivareasecdep_ibfk_1` 
    FOREIGN KEY (`divareasecid`) REFERENCES `tblutildivisionareasection` (`divareasecid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivareasecdepgroup` ADD CONSTRAINT `tblutildivareasecdepgroup_ibfk_2` 
    FOREIGN KEY (`divareasecdepid`) REFERENCES `tblutildivareasecdep` (`divareasecdepid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivareasecdepgroup` ADD CONSTRAINT `tblutildivareasecdepgroup_ibfk_1` 
    FOREIGN KEY (`groupteamid`) REFERENCES `tblutilgroupteam` (`groupteamid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivisionarea` ADD CONSTRAINT `tblutildivisionarea_ibfk_1` 
    FOREIGN KEY (`divid`) REFERENCES `tblutildivision` (`divid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivisionarea` ADD CONSTRAINT `tblutildivisionarea_ibfk_2` 
    FOREIGN KEY (`areaid`) REFERENCES `tblutilarea` (`areaid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivisionareasection` ADD CONSTRAINT `tblutildivisionareasection_ibfk_1` 
    FOREIGN KEY (`divareaid`) REFERENCES `tblutildivisionarea` (`divareaid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblutildivisionareasection` ADD CONSTRAINT `tblutildivisionareasection_ibfk_2` 
    FOREIGN KEY (`sectionid`) REFERENCES `tblutilsection` (`sectionid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tblemployeeinfo` ADD CONSTRAINT `tblsecuseracct_tblemployeeinfo` 
    FOREIGN KEY (`useracctid`) REFERENCES `tblsecuseracct` (`useracctid`);

ALTER TABLE `tblemployeeinfo` ADD CONSTRAINT `tblutiljoblevel_tblemployeeinfo` 
    FOREIGN KEY (`joblevelid`) REFERENCES `tblutiljoblevel` (`joblevelid`);

ALTER TABLE `tblemployeeinfo` ADD CONSTRAINT `tblutiljobstatus_tblemployeeinfo` 
    FOREIGN KEY (`jobstatusid`) REFERENCES `tblutiljobstatus` (`jobstatusid`);

ALTER TABLE `tblemployeeids` ADD CONSTRAINT `tblemployeeinfo_tblemployeeids` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeeposition` ADD CONSTRAINT `tblutilarea_tblemployeeposition` 
    FOREIGN KEY (`areaid`) REFERENCES `tblutilarea` (`areaid`);

ALTER TABLE `tblemployeeposition` ADD CONSTRAINT `tblutildivision_tblemployeeposition` 
    FOREIGN KEY (`divid`) REFERENCES `tblutildivision` (`divid`);

ALTER TABLE `tblemployeeposition` ADD CONSTRAINT `tblutilsection_tblemployeeposition` 
    FOREIGN KEY (`sectionid`) REFERENCES `tblutilsection` (`sectionid`);

ALTER TABLE `tblemployeeposition` ADD CONSTRAINT `tblutildepartment_tblemployeeposition` 
    FOREIGN KEY (`departmentid`) REFERENCES `tblutildepartment` (`departmentid`);

ALTER TABLE `tblemployeeposition` ADD CONSTRAINT `tblemployeeinfo_tblemployeeposition` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeeposition` ADD CONSTRAINT `tblutilposition_tblemployeeposition` 
    FOREIGN KEY (`positionid`) REFERENCES `tblutilposition` (`positionid`);

ALTER TABLE `tblemployeespouse` ADD CONSTRAINT `tblemployeeinfo_tblemployeespouse` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeeparents` ADD CONSTRAINT `tblemployeeinfo_tblemployeeparents` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeeparentsinlaw` ADD CONSTRAINT `tblemployeeinfo_tblemployeeparentsinlaw` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeechildren` ADD CONSTRAINT `tblutilrelationship_tblemployeechildren` 
    FOREIGN KEY (`relationshipid`) REFERENCES `tblutilrelationship` (`relationshipid`);

ALTER TABLE `tblemployeechildren` ADD CONSTRAINT `tblemployeeinfo_tblemployeechildren` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeesiblings` ADD CONSTRAINT `tblutilrelationship_tblemployeesiblings` 
    FOREIGN KEY (`relationshipid`) REFERENCES `tblutilrelationship` (`relationshipid`);

ALTER TABLE `tblemployeesiblings` ADD CONSTRAINT `tblemployeeinfo_tblemployeesiblings` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeereferences` ADD CONSTRAINT `tblutilposition_tblemployeereferences` 
    FOREIGN KEY (`positionid`) REFERENCES `tblutilposition` (`positionid`);

ALTER TABLE `tblemployeereferences` ADD CONSTRAINT `tblemployeeinfo_tblemployeereferences` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblimployeeincomeinfo` ADD CONSTRAINT `tblutilincometype_tblimployeeincomeinfo` 
    FOREIGN KEY (`incometypeid`) REFERENCES `tblutilincometype` (`incometypeid`);

ALTER TABLE `tblimployeeincomeinfo` ADD CONSTRAINT `tblemployeeinfo_tblimployeeincomeinfo` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeeleave` ADD CONSTRAINT `tblemployeeinfo_tblemployeeleave` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeeleave` ADD CONSTRAINT `tblutilleavetype_tblemployeeleave` 
    FOREIGN KEY (`leavetypeid`) REFERENCES `tblutilleavetype` (`leavetypeid`);

ALTER TABLE `tblemployeeovertime` ADD CONSTRAINT `tblemployeeinfo_tblemployeeovertime` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeededuction` ADD CONSTRAINT `tblemployeeinfo_tblemployeededuction` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeededuction` ADD CONSTRAINT `tblutildeductionnames_tblemployeededuction` 
    FOREIGN KEY (`deductionnamesid`) REFERENCES `tblutildeductionnames` (`deductionnamesid`);

ALTER TABLE `tblemployeedtr` ADD CONSTRAINT `tblemployeeinfo_tblemployeedtr` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeedtrcorrection` ADD CONSTRAINT `tblemployeedtr_tblemployeedtrcorrection` 
    FOREIGN KEY (`empdtrid`) REFERENCES `tblemployeedtr` (`empdtrid`);

ALTER TABLE `tblpayrollincome` ADD CONSTRAINT `tblpayrollheader_tblpayrollincome` 
    FOREIGN KEY (`payrollid`) REFERENCES `tblpayrollheader` (`payrollid`);

ALTER TABLE `tblpayrollincome` ADD CONSTRAINT `tblemployeeinfo_tblpayrollincome` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblpayrollincome` ADD CONSTRAINT `tblimployeeincomeinfo_tblpayrollincome` 
    FOREIGN KEY (`empincomeinfoid`) REFERENCES `tblimployeeincomeinfo` (`empincomeinfoid`);

ALTER TABLE `tblpayrollincome` ADD CONSTRAINT `tblemployeeinfo_tblpayrollincome` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblpayrollot` ADD CONSTRAINT `tblemployeeinfo_tblpayrollot` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblpayrollot` ADD CONSTRAINT `tblpayrollheader_tblpayrollot` 
    FOREIGN KEY (`payrollid`) REFERENCES `tblpayrollheader` (`payrollid`);

ALTER TABLE `tblpayrolldeduction` ADD CONSTRAINT `tblpayrollheader_tblpayrolldeduction` 
    FOREIGN KEY (`payrollid`) REFERENCES `tblpayrollheader` (`payrollid`);

ALTER TABLE `tblpayrolldeduction` ADD CONSTRAINT `tblemployeededuction_tblpayrolldeduction` 
    FOREIGN KEY (`empdeductid`) REFERENCES `tblemployeededuction` (`empdeductid`);

ALTER TABLE `tblmemo` ADD CONSTRAINT `tblemployeeinfo_tblmemo` 
    FOREIGN KEY (`employeeid`) REFERENCES `tblemployeeinfo` (`employeeid`);

ALTER TABLE `tblemployeememoreceived` ADD CONSTRAINT `tblmemo_tblemployeememoreceived` 
    FOREIGN KEY (`memoid`) REFERENCES `tblmemo` (`memoid`);
