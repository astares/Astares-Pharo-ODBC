"
A handle for a connection
"
Class {
	#name : #ODBCSQLConnectionHandle,
	#superclass : #ODBCSQLHandle,
	#instVars : [
		'environmentHandle',
		'isConnected'
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
ODBCSQLConnectionHandle class >> sqlConnect: connHandle server: serverName length: serverNameLength user: userName length: userNameLength password: password length: passwordLength [
 
	^ self ffiCall: #(SQLRETURN SQLConnect(ODBCSQLConnectionHandle connHandle, SQLCHAR* serverName, SQLSMALLINT serverNameLength, SQLCHAR * userName, SQLSMALLINT userNameLength, SQLCHAR * password, SQLSMALLINT passwordLength))
]

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> sqlDisconnect: connHandle [ 
	 
	^ self ffiCall: #(SQLRETURN SQLDisconnect(ODBCSQLConnectionHandle connHandle))
]

{ #category : #'private - accessing' }
ODBCSQLConnectionHandle class >> sqlHandleType [

	^SQL_HANDLE_DBC
]

{ #category : #connecting }
ODBCSQLConnectionHandle >> connect: dsn user: user password: password [ 
	
	| ret |
	self isConnected ifTrue: [ ^self ].
	
	ret := self class 
				sqlConnect: self 
				server: dsn 
				length: dsn size
				user: user 
				length: user size
				password: password 
				length: password size.
	(ret = SQL_SUCCESS) | (ret = SQL_SUCCESS_WITH_INFO) 
		ifTrue: [ 
			isConnected := true.
			
			"Now register for receiving a #finalize on the finalization executor (which is  
			 a shallow copy) to be able to close the connecton before it's handle is freed."
			self registerForFinalization ].
	^isConnected 	
]

{ #category : #connecting }
ODBCSQLConnectionHandle >> disconnect [ 
	self isConnected ifFalse: [ ^self ].
	self class sqlDisconnect: self.
	self unregisterFromFinalization
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
 	self class log: 'Finalize called'.
	self disconnect.
	environmentHandle := nil.
	super finalize 
]

{ #category : #initialization }
ODBCSQLConnectionHandle >> initialize [ 
	super initialize.
	isConnected := false.
	
]

{ #category : #testing }
ODBCSQLConnectionHandle >> isConnected [

	^isConnected
]

{ #category : #'private - finalization' }
ODBCSQLConnectionHandle >> registerForFinalization [

	WeakRegistry default add: self
]

{ #category : #'private - finalization' }
ODBCSQLConnectionHandle >> unregisterFromFinalization [

	WeakRegistry default remove: self ifAbsent: [ ]
]
