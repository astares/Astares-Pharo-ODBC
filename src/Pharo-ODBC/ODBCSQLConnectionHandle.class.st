"
A handle for a connection
"
Class {
	#name : #ODBCSQLConnectionHandle,
	#superclass : #ODBCSQLHandle,
	#instVars : [
		'environment'
	],
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> allocateConnectionHandle: outputHandle on: anEnvironmentHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_DBC, ODBCSQLEnvironmentHandle anEnvironmentHandle,  ODBCSQLConnectionHandle* outputHandle))
]

{ #category : #'instance allocation' }
ODBCSQLConnectionHandle class >> forODBC3 [
	<script: 'self forODBC3 inspect'>
  
 	^self on: ODBCSQLEnvironmentHandle forODBC3
	
]

{ #category : #'instance allocation' }
ODBCSQLConnectionHandle class >> on: anODBCEnvironment [
	| conn ret |
	conn := self new
		environment: anODBCEnvironment;
		yourself.
	ret := self allocateConnectionHandle: conn on: anODBCEnvironment.
	^ ret = SQL_SUCCESS
		ifTrue: [ ^ conn ]
		ifFalse:
			[ self error: 'Not able to allocate ODBC connection: ' , ret asString ]
				yourself
]

{ #category : #'private - accessing' }
ODBCSQLConnectionHandle class >> sqlHandleType [

	^SQL_HANDLE_DBC
]

{ #category : #accessing }
ODBCSQLConnectionHandle >> environment [
	^ environment
]

{ #category : #accessing }
ODBCSQLConnectionHandle >> environment: anObject [
	environment := anObject
]

{ #category : #'private - finalization' }
ODBCSQLConnectionHandle >> finalize [ 
	environment := nil.
	super finalize 
]
