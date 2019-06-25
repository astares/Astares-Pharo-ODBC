"
Unit tests for ODBCDataSource
"
Class {
	#name : #ODBCDataSourceTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-Core-Tests-Base'
}

{ #category : #tests }
ODBCDataSourceTest >> testInstanceCreation [ 

	| instance |
	instance := ODBCDataSource name: 'source' description: 'some details'.
	self 
		assert: instance name equals: 'source';
		assert: instance description equals: 'some details'
]
