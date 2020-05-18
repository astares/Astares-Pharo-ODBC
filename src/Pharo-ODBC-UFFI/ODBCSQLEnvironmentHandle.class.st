"
An environment handle
"
Class {
	#name : #ODBCSQLEnvironmentHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Model'
}

{ #category : #accessing }
ODBCSQLEnvironmentHandle class >> allDataSourceInfos [
	"Return all available data sources with name and description"
	<script: 'self allDataSourceInfos inspect'>
	
	| env serverName description ret dataSources dir |
	env := self forODBC3_80.
 	dataSources := OrderedCollection new.
	serverName := ByteArray new: 256.
	description := ByteArray new: 256. 
	dir := SQL_FETCH_FIRST.
	[ ret := self getDataSources: env direction: dir 
					  serverName: serverName   length: serverName  byteSize nameLength: 0 
					  description: description length: description byteSize nameLength: 0.
	  ret = SQL_SUCCESS ] whileTrue: [ 
		dataSources add: (serverName asString copyUpTo: Character null) -> (description asString copyUpTo: Character null).
		dir := SQL_FETCH_NEXT.
	].
	^dataSources
	
]

{ #category : #accessing }
ODBCSQLEnvironmentHandle class >> allDriversInfos [
	"Return all available drivers with name and attributes"
	<script: 'self allDriversInfos inspect'>
	
	| env serverName  attributes ret dataSources dir |
	env := self forODBC3_80.
 	dataSources := OrderedCollection new.
	serverName := ByteArray new: 256.
	attributes := ByteArray new: 256. 
	dir := SQL_FETCH_FIRST.
	[ ret := self getDrivers: env direction: dir 
					  driverName: serverName   length: serverName  byteSize nameLength: 0 
					  attributes: attributes length: attributes byteSize nameLength: 0.
	  ret = SQL_SUCCESS ] whileTrue: [ 
		dataSources add: (serverName asString copyUpTo: Character null) -> (attributes asString copyUpTo: Character null).
		dir := SQL_FETCH_NEXT.
	].
	^dataSources
	
]

{ #category : #'private - allocation' }
ODBCSQLEnvironmentHandle class >> allocate [

	|env ret|
	env := self new.
	ret := self allocateEnvironmentHandle: env.
	^ret = SQL_SUCCESS 
		ifTrue: [ ^env ]
		ifFalse: [ self error: 'Not able to allocate ODBC environment' ]

]

{ #category : #'private - allocation' }
ODBCSQLEnvironmentHandle class >> allocateEnvironmentHandle: outputHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, ODBCSQLEnvironmentHandle* outputHandle))
]

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> forODBC2 [
	
	^self 
		allocate
		useODBC2;
		yourself
]

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> forODBC3 [

	^self 
		allocate
		useODBC3;
		yourself
]

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> forODBC3_80 [

	^self 
		allocate
		useODBC3_80;
		yourself
]

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> forODBC4 [
	
	^self 
		allocate
		useODBC4;
		yourself
]

{ #category : #'private - primitives' }
ODBCSQLEnvironmentHandle class >> getDataSources: env direction: direction serverName: serverName length: bufferLength1 nameLength: nameLength1Ptr description: description length: bufferLength2 nameLength: nameLength2Ptr [
	
	^ self ffiCall: #(SQLRETURN SQLDataSources(ODBCSQLEnvironmentHandle env, SQLUSMALLINT direction, SQLCHAR* serverName, SQLSMALLINT bufferLength1, SQLSMALLINT* nameLength1Ptr, SQLCHAR* description, SQLSMALLINT bufferLength2, SQLSMALLINT* nameLength2Ptr))
	
]

{ #category : #'private - primitives' }
ODBCSQLEnvironmentHandle class >> getDrivers: env direction: direction driverName: driverName length: bufferLength1 nameLength: nameLength1Ptr attributes: attributes length: bufferLength2 nameLength: nameLength2Ptr [
	
	^ self ffiCall: #(SQLRETURN SQLDrivers(ODBCSQLEnvironmentHandle env, SQLUSMALLINT direction, SQLCHAR* driverName, SQLSMALLINT bufferLength1, SQLSMALLINT* nameLength1Ptr, SQLCHAR* attributes, SQLSMALLINT bufferLength2, SQLSMALLINT* nameLength2Ptr))
	
]

{ #category : #'private - primitives' }
ODBCSQLEnvironmentHandle class >> setODBCVersion: env to: odbcVersion [

	^ self ffiCall: #(SQLRETURN SQLSetEnvAttr(ODBCSQLEnvironmentHandle env, SQL_ATTR_ODBC_VERSION, SQLPOINTER odbcVersion, 0))
	
]

{ #category : #'private - accessing' }
ODBCSQLEnvironmentHandle class >> sqlHandleType [

	^SQL_HANDLE_ENV
]

{ #category : #'private - accessing' }
ODBCSQLEnvironmentHandle >> setODBCVersion: aVersion [
	"aVersion is one of the SQL_OV_ ... symbols"
 	self class setODBCVersion: self to: (ExternalAddress fromAddress: aVersion)
]

{ #category : #'accessing - version' }
ODBCSQLEnvironmentHandle >> useODBC2 [
 	self setODBCVersion: SQL_OV_ODBC2
]

{ #category : #'accessing - version' }
ODBCSQLEnvironmentHandle >> useODBC3 [
 	self setODBCVersion: SQL_OV_ODBC3
]

{ #category : #'accessing - version' }
ODBCSQLEnvironmentHandle >> useODBC3_80 [
 	self setODBCVersion: SQL_OV_ODBC3_80
]

{ #category : #'accessing - version' }
ODBCSQLEnvironmentHandle >> useODBC4 [
 	self setODBCVersion: SQL_OV_ODBC4
]
