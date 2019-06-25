Class {
	#name : #ODBCConnectionDescriptionTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-Core-Tests-Base'
}

{ #category : #tests }
ODBCConnectionDescriptionTest >> testDefaultODBCVersion [ 

	self assert: ODBCConnectionDescription defaultODBCVersion notEmpty 
]

{ #category : #tests }
ODBCConnectionDescriptionTest >> testInstantiate [

	| instance |
	instance := ODBCConnectionDescription dsn: 'database' user: 'pharo' password: 'secret'.
	self
		assert: instance dataSourceName equals: 'database'; 
		assert: instance user equals: 'pharo';
		assert: instance password equals: 'secret';
		assert: instance odbcVersion equals: ODBCConnectionDescription defaultODBCVersion 
]
