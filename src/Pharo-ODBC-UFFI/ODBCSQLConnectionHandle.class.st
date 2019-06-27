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
	ret := self sqlAllocateConnectionHandle: conn on: anODBCEnvironmentHandle.
	^ ret = SQL_SUCCESS
		ifTrue: [ ^ conn ]
		ifFalse:
			[ self error: 'Not able to allocate ODBC connection: ' , ret asString ]
				yourself
]

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> sqlAllocateConnectionHandle: outputHandle on: anEnvironmentHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_DBC, #ODBCSQLEnvironmentHandle anEnvironmentHandle,  #ODBCSQLConnectionHandle* outputHandle))
]

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> sqlConnect: env server: serverName length: serverNameLength user: userName length: userNameLength password: password length: passwordLength [
 
	^ self ffiCall: #(SQLRETURN SQLConnect(ODBCSQLConnectionHandle env, SQLCHAR* serverName, SQLSMALLINT serverNameLength, SQLCHAR * userName, SQLSMALLINT userNameLength, SQLCHAR * password, SQLSMALLINT passwordLength))
]

{ #category : #'private - accessing' }
ODBCSQLConnectionHandle class >> sqlHandleType [

	^SQL_HANDLE_DBC
]

{ #category : #connecting }
ODBCSQLConnectionHandle >> connect: dsn user: user password: password [ 
	
	| ret |
	ret := self class 
				sqlConnect: self 
				server: dsn 
				length: dsn size
				user: user 
				length: user size
				password: password 
				length: password size.
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
