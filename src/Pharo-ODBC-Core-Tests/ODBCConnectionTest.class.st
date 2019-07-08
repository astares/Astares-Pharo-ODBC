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

{ #category : #tests }
ODBCConnectionTest >> testExecuteStatementWithArgumentsWithoutConnection [

	| conn |
	conn := ODBCConnection dsn: 'mydatabase' user: 'pharo' password: 'secret'. 
	
	self should: [ 	conn executeQuery: 'INSERT INTO X' with: #() ] raise: ODBCNotConnected 
 
]

{ #category : #tests }
ODBCConnectionTest >> testExecuteStatementWithoutConnection [

	| conn |
	conn := ODBCConnection dsn: 'mydatabase' user: 'pharo' password: 'secret'. 
	
	self should: [ 	conn executeQuery: 'INSERT INTO X' ] raise: ODBCNotConnected 
 
]
