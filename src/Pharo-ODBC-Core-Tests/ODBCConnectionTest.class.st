"
Unit tests for ODBCConnection
"
Class {
	#name : #ODBCConnectionTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-Core-Tests-Base'
}

{ #category : #tests }
ODBCConnectionTest >> testAccessingConnectionDescription [

	| conn desc |
	conn := ODBCConnection dsn: 'mydatabase' user: 'pharo' password: 'secret'. 
	desc := conn connectionDescription.
	
	self 
		assert: desc dataSourceName equals: 'mydatabase';
		assert: desc user equals: 'pharo';
		assert: desc password equals: 'secret';
		assert: desc odbcVersion equals: ODBCConnectionDescription defaultODBCVersion 
]
