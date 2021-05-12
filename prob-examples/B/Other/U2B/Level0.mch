MACHINE Level0
/*" U2B3.7.4 generated this component from Package Level0 09/03/2004 08:41:35 "*/
/*" Devices are registered to a CentralSystem.  A Doctor selects a location-based action "*/
/*"  on his PDA, to access a document via an ExternalDevice. "*/
/*"    "*/

SETS
	DOCTOR;
	DEVICE;
	DOCUMENT;
	CENTRALSYSTEM={thisCENTRALSYSTEM};
	ID={Mark, Chris, David, Dan};
	DOCNAME={patient1.xray, patient2.xray};
	ATTR={read, write, resolution, numcolor, filesize};
	DEVICEID={ID1, ID2, ID3. ID4, ID5, ID6};
	SERVNAME={display, access};
	ROLES={doctor, patient, administrator, visitor};
	MYEVENTS
CONSTANTS
	EXTERNALDEVICE,
	PDA
PROPERTIES
	EXTERNALDEVICE : POW(DEVICE) &
	PDA : POW(DEVICE)
DEFINITIONS
type_invariant == (
	DOCTOR_Name : DOCTOR --> ID &
	DOCTOR_owns : DOCTOR >->> PDA &
	DEVICE_Id : DEVICE --> DEVICEID &
	DEVICE_AvailableServices : DEVICE --> (SERVNAME +-> DEVICEID) &
	DEVICE_Signals : DEVICE --> POW(NAT1) &
	DEVICE_registeredTo : DEVICE --> CENTRALSYSTEM &
	PDA_uses : PDA --> POW(EXTERNALDEVICE) &
	DOCUMENT_Name : DOCUMENT --> DOCNAME &
	DOCUMENT_Attributes : DOCUMENT --> ATTR &
	DOCUMENT_devices : DOCUMENT --> POW(DEVICE) &
	CENTRALSYSTEM_ValidID : CENTRALSYSTEM --> POW(DEVICEID) &
	CENTRALSYSTEM_Services : CENTRALSYSTEM --> (DEVICEID +-> POW(SERVNAME)) &
	CENTRALSYSTEM_Location : CENTRALSYSTEM --> (DEVICEID >+>> POSITION) &
	CENTRALSYSTEM_Map : CENTRALSYSTEM --> (POSITION >+>> POW(NAT1)) &
	CENTRALSYSTEM_Role : CENTRALSYSTEM --> (DEVICEID --> ROLES) &
	CENTRALSYSTEM_Audittrail : CENTRALSYSTEM --> seq(MYEVENTS)
)
VARIABLES
	DOCTOR_Name,
	DOCTOR_owns,
	DEVICE_Id,
	DEVICE_AvailableServices,
	DEVICE_Signals,
	DEVICE_registeredTo,
	PDA_uses,
	DOCUMENT_Name,
	DOCUMENT_Attributes,
	DOCUMENT_devices,
	CENTRALSYSTEM_ValidID,
	CENTRALSYSTEM_Services,
	CENTRALSYSTEM_Location,
	CENTRALSYSTEM_Map,
	CENTRALSYSTEM_Role,
	CENTRALSYSTEM_Audittrail
INVARIANT
	type_invariant
INITIALISATION
	  validID := {PDA1, PDA2, PDA3, PDA4, Display0, Bed0}

OPERATIONS
returnValue <--  executeService (thisDEVICE,device,service) =
PRE
	thisDEVICE:DEVICE &
	device:DEVICEID &
	service:SERVNAME
THEN
	skip
END
;
location <--  computeLocation (signals) =
PRE
	signals:POW(NAT1)
THEN
	location
END
;
availServices <--  sendAvailableServices (device,signals) =
PRE
	device:DEVICEID &
	signals:POW(NAT1) &
	device : validID
THEN
	location(device) := computeLocation(signals) ||
	availServices :: services(device)
END
END
