Class {
	#name : #ODBCSQLEnvironmentHandleTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-UFFI-Tests-Model'
}

{ #category : #tests }
ODBCSQLEnvironmentHandleTest >> testAllocateNewHandles [

	|h1 h2|
	h1 := ODBCSQLEnvironmentHandle allocate.
	h2 := ODBCSQLEnvironmentHandle allocate.
	self deny: h1 handle equals: h2 handle
	
]

{ #category : #'tests - drivers' }
ODBCSQLEnvironmentHandleTest >> testDriverInfoIsAvailable [ 

	self assert: ODBCSQLEnvironmentHandle allDriversInfos notEmpty
]

{ #category : #tests }
ODBCSQLEnvironmentHandleTest >> testMinimumODBCVersion [

	self assert: ODBCSQLEnvironmentHandle forODBC3_80 notNil
]
