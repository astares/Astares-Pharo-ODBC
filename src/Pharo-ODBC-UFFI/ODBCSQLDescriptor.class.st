"
A handle for a descriptor
"
Class {
	#name : #ODBCSQLDescriptor,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-UFFI-Model'
}

{ #category : #'private - accessing' }
ODBCSQLDescriptor class >> sqlHandleType [

	^SQL_HANDLE_DESC
]
