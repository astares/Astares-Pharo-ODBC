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
		'connectionDescription',
		'connectionHandle'
	],
	#category : #'Pharo-ODBC-Core-Base'
}

{ #category : #'instance creation' }
ODBCConnection class >> dsn: dataSourceName user: user password: password [

	^self for: (ODBCConnectionDescription dsn: dataSourceName user: user password: password)
]

{ #category : #examples }
ODBCConnection class >> example2 [

	|conn|
conn := ODBCConnection dsn: 'PostgreSQL35W' user: 'postgres' password: (UIManager default request: 'Password' initialAnswer: 'il').
conn open.
]

{ #category : #examples }
ODBCConnection class >> example32Bit [

	| conn |
	conn := ODBCConnection dsn: 'pharo_sqlite3' user:  '' password: ''.
	conn open
]

{ #category : #examples }
ODBCConnection class >> example64Bit [

	| conn |
	conn := ODBCConnection dsn: 'pharo_sqlite64' user:  '' password: ''.
	conn open
]

{ #category : #'instance creation' }
ODBCConnection class >> for: aConnectionDescription [

	^(self new)
		connectionDescription: aConnectionDescription;
		yourself
	

]

{ #category : #opening }
ODBCConnection >> close [

	connectionHandle disconnect
]

{ #category : #accessing }
ODBCConnection >> connectionDescription [
	^ connectionDescription
]

{ #category : #'private - accessing' }
ODBCConnection >> connectionDescription: anObject [
	connectionDescription := anObject
]

{ #category : #statements }
ODBCConnection >> executeQuery: queryString [

	^self executeQuery: queryString with: #()
	
]

{ #category : #statements }
ODBCConnection >> executeQuery: queryString with: arguments [
	"Execute the given query string using the given arguments"
	
	|statement result |
	statement := self statementClass connection: self query: queryString.
	result := statement executeWithArguments: arguments.
	^result
]

{ #category : #testing }
ODBCConnection >> isConnected [

	^connectionHandle ifNil: [ false ] ifNotNil: [ connectionHandle isConnected ]
]

{ #category : #opening }
ODBCConnection >> open [ 
	| envHandle |
	envHandle := self connectionDescription instantiateODBCEnvironment.
	connectionHandle := ODBCSQLConnectionHandle on: envHandle.
	connectionHandle connect: self connectionDescription dataSourceName 
							user: self connectionDescription user 
							password: self connectionDescription password
]

{ #category : #'private - accessing' }
ODBCConnection >> statementClass [
	"Return the default statement class"
	
	^ODBCStatement
]
