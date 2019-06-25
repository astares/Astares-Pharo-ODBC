"
A handle for a connection
"
Class {
	#name : #ODBCSQLConnection,
	#superclass : #ODBCSQLHandle,
	#instVars : [
		'environment'
	],
	#category : #'Pharo-ODBC-UFFI-Model'
}

{ #category : #'private - primitives' }
ODBCSQLConnection class >> allocateConnectionHandle: outputHandle on: anEnvironmentHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_DBC, #ODBCSQLEnvironmentHandle anEnvironmentHandle,  ODBCSQLConnection* outputHandle))
]

{ #category : #examples }
ODBCSQLConnection class >> forODBC3 [
	<script: 'self forODBC3 inspect'>
  
 	^self on: ODBCSQLEnvironmentHandle forODBC3
	
]

{ #category : #'instance allocation' }
ODBCSQLConnection class >> on: anODBCEnvironment [
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
ODBCSQLConnection class >> sqlHandleType [

	^SQL_HANDLE_DBC
]

{ #category : #accessing }
ODBCSQLConnection >> environment [
	^ environment
]

{ #category : #accessing }
ODBCSQLConnection >> environment: anObject [
	environment := anObject
]

{ #category : #'private - finalization' }
ODBCSQLConnection >> finalize [ 
	environment := nil.
	super finalize 
]
