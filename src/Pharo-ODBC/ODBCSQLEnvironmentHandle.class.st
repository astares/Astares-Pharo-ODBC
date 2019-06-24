"
An environment handle
"
Class {
	#name : #ODBCSQLEnvironmentHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> allocate [
	<script: 'self allocate inspect'>
	|env ret|
	env := self new.
	ret := self allocateEnvironmentHandle: env.
	^ret = SQL_SUCCESS 
		ifTrue: [ ^env ]
		ifFalse: [ self error: 'Not able to allocate ODBC environment' ]

]

{ #category : #'private - primitives' }
ODBCSQLEnvironmentHandle class >> allocateEnvironmentHandle: outputHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE,  ODBCSQLEnvironmentHandle* outputHandle))
]

{ #category : #'private - finalization' }
ODBCSQLEnvironmentHandle class >> freeHandle: handle [
	"Free up the handle and its associated resources"	
		
	self ffiCall: #(SQLRETURN SQLFreeHandle (SQL_HANDLE_ENV, ODBCSQLEnvironmentHandle handle))
	
]

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> setODBCVersion: env to: odbcVersion [
	
	self ffiCall: #(SQLRETURN SQLSetEnvAttr(ODBCSQLEnvironmentHandle env, SQL_ATTR_ODBC_VERSION, SQLPOINTER odbcVersion, 0))
	
]

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> setup [
	<script: 'self setup inspect'>
	|env ret|
	env := self allocate.
	ret := self setODBCVersion: env to: (ExternalAddress fromAddress: SQL_OV_ODBC3).
	^ret = SQL_SUCCESS 
		ifFalse: [ self error: 'Not able to setup ODBC 3.0' ]

]

{ #category : #accessing }
ODBCSQLEnvironmentHandle >> defineODBC3 [
 
	(self setAttribute: SQL_ATTR_ODBC_VERSION value: SQL_OV_ODBC3 length: 1) inspect
]

{ #category : #accessing }
ODBCSQLEnvironmentHandle >> setAttribute: attribute value: valuePtr length: stringLength [

	^self ffiCall: #(SQLRETURN SQLSetEnvAttr(self, SQLINTEGER attribute,  
     															SQLPOINTER valuePtr,  
     															SQLINTEGER stringLength))
]
