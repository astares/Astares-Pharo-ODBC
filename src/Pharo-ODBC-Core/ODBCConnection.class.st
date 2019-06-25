"
An ODBC connection. The connection by default uses the default ODBC version as given 
in

	ODBCConnectionDescription defaultODBCVersion 

See the class comment of this class. To use a connection either use it with a connection 
description: 

	|desc|
	desc := ODBCConnectionDescription dsn: 'mydatabase' user: 'pharo' password: 'secret' 
	conn := ODBCConnection for: desc.
	conn open 

or directly use the class:

	(ODBCConnection dsn: 'mydatabase' user: 'pharo' password: 'secret') open


"
Class {
	#name : #ODBCConnection,
	#superclass : #Object,
	#instVars : [
		'connectionDescription'
	],
	#category : #'Pharo-ODBC-Core-Base'
}

{ #category : #'instance creation' }
ODBCConnection class >> dsn: dataSourceName user: user password: password [

	^self for: (ODBCConnectionDescription dsn: dataSourceName user: user password: password)
]

{ #category : #'instance creation' }
ODBCConnection class >> for: aConnectionDescription [

	^(self new)
		connectionDescription: aConnectionDescription;
		yourself
	

]

{ #category : #accessing }
ODBCConnection >> connectionDescription [
	^ connectionDescription
]

{ #category : #accessing }
ODBCConnection >> connectionDescription: anObject [
	connectionDescription := anObject
]
