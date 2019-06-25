Class {
	#name : #ODBCSQLEnvironmentHandleTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-UFFI-Tests-Model'
}

{ #category : #tests }
ODBCSQLEnvironmentHandleTest >> testDriverInfoIsAvailable [ 

	self assert: ODBCSQLEnvironmentHandle allDriversInfos notEmpty
]
