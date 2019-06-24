"
An ODBC driver
"
Class {
	#name : #ODBCDriver,
	#superclass : #Object,
	#instVars : [
		'name',
		'attributes'
	],
	#category : #'Pharo-ODBC-UFFI-Model'
}

{ #category : #'instance creation' }
ODBCDriver class >> name: aName attributes: attributeDescription [

	^(self new)
		name: aName;
		attributes: attributeDescription;
		yourself
]

{ #category : #comparing }
ODBCDriver >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #accessing }
ODBCDriver >> attributes [
	^ attributes
]

{ #category : #accessing }
ODBCDriver >> attributes: anObject [
	attributes := anObject
]

{ #category : #comparing }
ODBCDriver >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
ODBCDriver >> name [
	^ name
]

{ #category : #accessing }
ODBCDriver >> name: anObject [
	name := anObject
]

{ #category : #printing }
ODBCDriver >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream
		nextPutAll: name asString;
		nextPutAll: ' - ';
		nextPutAll: attributes asString
]