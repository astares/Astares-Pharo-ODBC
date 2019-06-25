Extension { #name : #ODBCConnectionDescription }

{ #category : #'*Pharo-ODBC-UI' }
ODBCConnectionDescription class >> odbcSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #odbc)
		label: 'ODBC' ;  
		description: 'All settings regarding ODBC';
		with: [
			(aBuilder pickOne: #defaultODBCVersion)
				label: 'Default ODBC version to use';
				target: self;
				default: self defaultODBCVersion;
				order: 1;
				domainValues: self availableODBCVersions ]
]
