"
A handle for a connection
"
Class {
	#name : #ODBCSQLConnectionHandle,
	#superclass : #ODBCSQLHandle,
	#instVars : [
		'environmentHandle'
	],
	#category : #'Pharo-ODBC-UFFI-Model'
}

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> allocateConnectionHandle: outputHandle on: anEnvironmentHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_DBC, #ODBCSQLEnvironmentHandle anEnvironmentHandle,  #ODBCSQLConnectionHandle* outputHandle))
]

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> connect: env server: serverName length: serverNameLength user: userName length: userNameLength password: password length: passwordLength [

	^ self ffiCall: #(SQLRETURN SQLConnect(ODBCSQLEnvironmentHandle env, SQLCHAR* serverName, SQLSMALLINT serverNameLength, SQLCHAR * userName, SQLSMALLINT userNameLength, SQLCHAR * password, SQLSMALLINT passwordLength))
]

{ #category : #examples }
ODBCSQLConnectionHandle class >> forODBC3 [
	<script: 'self forODBC3 inspect'>
  
 	^self on: ODBCSQLEnvironmentHandle forODBC3
	
]

{ #category : #'instance allocation' }
ODBCSQLConnectionHandle class >> on: anODBCEnvironmentHandle [
	| conn ret |
	conn := self new
		environmentHandle: anODBCEnvironmentHandle;
		yourself.
	ret := self allocateConnectionHandle: conn on: anODBCEnvironmentHandle.
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

{ #category : #connecting }
ODBCSQLConnectionHandle >> connect: dsn user: user password: password [ 
	
	| ret |
	ret := self class 
		connect: self environmentHandle 
		server: dsn 
		length: dsn byteSize  
		user: user 
		length: user byteSize 
		password: password 
		length: password byteSize.
	ret inspect	
]

{ #category : #accessing }
ODBCSQLConnectionHandle >> environmentHandle [
	^ environmentHandle
]

{ #category : #accessing }
ODBCSQLConnectionHandle >> environmentHandle: anObject [
	environmentHandle := anObject
]

{ #category : #'private - finalization' }
ODBCSQLConnectionHandle >> finalize [ 
	environmentHandle := nil.
	super finalize 
]
