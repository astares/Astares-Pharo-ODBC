"
Constants for Microsoft SQL Extensions
"
Class {
	#name : #ODBCSQLConstantsEx,
	#superclass : #SharedPool,
	#classVars : [
		'SQL_ATTR_APPLICATION_KEY',
		'SQL_ATTR_CONNECTION_POOLING',
		'SQL_ATTR_CP_MATCH',
		'SQL_ATTR_ODBC_VERSION',
		'SQL_CP_DEFAULT',
		'SQL_CP_DRIVER_AWARE',
		'SQL_CP_OFF',
		'SQL_CP_ONE_PER_DRIVER',
		'SQL_CP_ONE_PER_HENV',
		'SQL_OV_ODBC2',
		'SQL_OV_ODBC3',
		'SQL_OV_ODBC3_80',
		'SQL_OV_ODBC4'
	],
	#category : #'Pharo-ODBC-UFFI-UFFI-Support'
}

{ #category : #initialization }
ODBCSQLConstantsEx class >> initialize [

	self 
		initializeEnvironmentAttributes;
		initializeConnectionPoolingAttributes;
		initializeODBCVersions
]

{ #category : #'private - initialization' }
ODBCSQLConstantsEx class >> initializeConnectionPoolingAttributes [

	SQL_CP_OFF := 0.
	SQL_CP_ONE_PER_DRIVER := 1.
	SQL_CP_ONE_PER_HENV := 2.
	SQL_CP_DRIVER_AWARE := 3.
	SQL_CP_DEFAULT := SQL_CP_OFF
]

{ #category : #'private - initialization' }
ODBCSQLConstantsEx class >> initializeEnvironmentAttributes [

	SQL_ATTR_ODBC_VERSION := 200.
	SQL_ATTR_CONNECTION_POOLING := 201.
	SQL_ATTR_CP_MATCH := 202.
	SQL_ATTR_APPLICATION_KEY := 203.
]

{ #category : #'private - initialization' }
ODBCSQLConstantsEx class >> initializeODBCVersions [

	SQL_OV_ODBC2 := 2.
	SQL_OV_ODBC3 := 3.
	
	SQL_OV_ODBC3_80 := 380.
	SQL_OV_ODBC4 := 400
]
