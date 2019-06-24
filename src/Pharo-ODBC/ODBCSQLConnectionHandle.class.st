"
A handle for a connection
"
Class {
	#name : #ODBCSQLConnectionHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'instance allocation' }
ODBCSQLConnectionHandle class >> allocate [
	<script: 'self allocate inspect'>
	|env ret conn |
	env := ODBCSQLEnvironmentHandle forODBC3. 
	conn := self new.
	 
	ret := self allocateConnectionHandle: conn on: env.
	^ret = SQL_SUCCESS 
		ifTrue: [ ^conn ]
		ifFalse: [ self error: 'Not able to allocate ODBC connection: ', ret asString ]

]

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> allocateConnectionHandle: outputHandle on: anEnvironmentHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_DBC, ODBCSQLEnvironmentHandle anEnvironmentHandle,  ODBCSQLConnectionHandle* outputHandle))
]

{ #category : #'private - finalization' }
ODBCSQLConnectionHandle class >> freeHandle: handle [
	"Free up the handle and its associated resources"	
		
	self freeHandle: handle ofType: SQL_HANDLE_DBC
	
]

{ #category : #'private - accessing' }
ODBCSQLConnectionHandle class >> sqlHandleType [

	^SQL_HANDLE_DBC
]
