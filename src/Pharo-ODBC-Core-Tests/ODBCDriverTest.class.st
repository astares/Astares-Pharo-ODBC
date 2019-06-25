"
Unit tests for ODBCDriver
"
Class {
	#name : #ODBCDriverTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-Core-Tests-Base'
}

{ #category : #tests }
ODBCDriverTest >> testDriversAreAvailable [

	self assert: ODBCDriver allAvailable notEmpty
	
]
