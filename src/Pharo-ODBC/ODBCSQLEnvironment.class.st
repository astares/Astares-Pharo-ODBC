"
An environment handle
"
Class {
	#name : #ODBCSQLEnvironment,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - allocation' }
ODBCSQLEnvironment class >> allocate [
	<script: 'self allocate inspect'>
	|env ret|
	env := self new.
	ret := self allocateEnvironmentHandle: env.
	^ret = SQL_SUCCESS 
		ifTrue: [ ^env ]
		ifFalse: [ self error: 'Not able to allocate ODBC environment' ]

]

{ #category : #'private - primitives' }
ODBCSQLEnvironment class >> allocateEnvironmentHandle: outputHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE,  ODBCSQLEnvironmentHandle* outputHandle))
]

{ #category : #'instance allocation' }
ODBCSQLEnvironment class >> forODBC2 [
	<script: 'self forODBC2 inspect'>
	
	^self 
		allocate
		useODBC2;
		yourself
]

{ #category : #'instance allocation' }
ODBCSQLEnvironment class >> forODBC3 [
	<script: 'self forODBC3 inspect'>
	
	^self 
		allocate
		useODBC3;
		yourself
]

{ #category : #'instance allocation' }
ODBCSQLEnvironment class >> forODBC3_80 [
	<script: 'self forODBC3_80 inspect'>
	
	^self 
		allocate
		useODBC3_80;
		yourself
]

{ #category : #'instance allocation' }
ODBCSQLEnvironment class >> forODBC4 [
	<script: 'self forODBC4 inspect'>
	
	^self 
		allocate
		useODBC4;
		yourself
]

{ #category : #'private - primitives' }
ODBCSQLEnvironment class >> setODBCVersion: env to: odbcVersion [
	
	self ffiCall: #(SQLRETURN SQLSetEnvAttr(ODBCSQLEnvironmentHandle env, SQL_ATTR_ODBC_VERSION, SQLPOINTER odbcVersion, 0))
	
]

{ #category : #'private - accessing' }
ODBCSQLEnvironment class >> sqlHandleType [

	^SQL_HANDLE_ENV
]

{ #category : #'private - accessing' }
ODBCSQLEnvironment >> setODBCVersion: aVersion [
	"aVersion is one of the SQL_OV_ ... symbols"
 	self class setODBCVersion: self to: (ExternalAddress fromAddress: aVersion)
]

{ #category : #'accessing - version' }
ODBCSQLEnvironment >> useODBC2 [
 	self setODBCVersion: SQL_OV_ODBC2
]

{ #category : #'accessing - version' }
ODBCSQLEnvironment >> useODBC3 [
 	self setODBCVersion: SQL_OV_ODBC3
]

{ #category : #'accessing - version' }
ODBCSQLEnvironment >> useODBC3_80 [
 	self setODBCVersion: SQL_OV_ODBC3_80
]

{ #category : #'accessing - version' }
ODBCSQLEnvironment >> useODBC4 [
 	self setODBCVersion: SQL_OV_ODBC4
]
