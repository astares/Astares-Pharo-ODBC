"
A handle for a descriptor
"
Class {
	#name : #ODBCSQLDescriptorHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - accessing' }
ODBCSQLDescriptorHandle class >> sqlHandleType [

	^SQL_HANDLE_DESC
]
