"
A regular SQL statement
"
Class {
	#name : #ODBCStatement,
	#superclass : #Object,
	#instVars : [
		'connection',
		'queryString'
	],
	#category : #'Pharo-ODBC-Core-Statements'
}

{ #category : #'instance creation' }
ODBCStatement class >> connection: aConnection query: aQueryString [

	^(self new)
		connection: aConnection;
		queryString: aQueryString;
		yourself
]

{ #category : #'private - utilities' }
ODBCStatement >> checkConnected [

	self connection isConnected ifFalse: [ ODBCNotConnected signal: 'Need to be connected to run statement' ]
]

{ #category : #'private - accessing' }
ODBCStatement >> connection [
	^ connection
]

{ #category : #'private - accessing' }
ODBCStatement >> connection: anObject [
	connection := anObject
]

{ #category : #execution }
ODBCStatement >> executeWithArguments: arguments [

	self checkConnected.
]

{ #category : #'private - accessing' }
ODBCStatement >> queryString [
	^ queryString
]

{ #category : #'private - accessing' }
ODBCStatement >> queryString: anObject [
	queryString := anObject
]
