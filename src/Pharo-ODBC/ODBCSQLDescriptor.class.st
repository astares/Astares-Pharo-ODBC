"
A handle for a descriptor
"
Class {
	#name : #ODBCSQLDescriptor,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - accessing' }
ODBCSQLDescriptor class >> sqlHandleType [

	^SQL_HANDLE_DESC
]
