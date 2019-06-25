"
An ODBC data source
"
Class {
	#name : #ODBCDataSource,
	#superclass : #Object,
	#instVars : [
		'name',
		'description'
	],
	#category : #'Pharo-ODBC-Core-Base'
}

{ #category : #'instance creation' }
ODBCDataSource class >> name: aName description: aDescription [

	^(self new)
		name: aName;
		description: aDescription;
		yourself
]

{ #category : #comparing }
ODBCDataSource >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #accessing }
ODBCDataSource >> description [
	^ description
]

{ #category : #accessing }
ODBCDataSource >> description: anObject [
	description := anObject
]

{ #category : #comparing }
ODBCDataSource >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
ODBCDataSource >> name [
	^ name
]

{ #category : #accessing }
ODBCDataSource >> name: anObject [
	name := anObject
]

{ #category : #printing }
ODBCDataSource >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream
		nextPutAll: name asString;
		nextPutAll: ' - ';
		nextPutAll: description asString
]
