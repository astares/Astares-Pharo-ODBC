"
A handle for a descriptor
"
Class {
	#name : #ODBCSQLDescriptorHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - finalization' }
ODBCSQLDescriptorHandle class >> freeHandle: handle [
	"Free up the handle and its associated resources"	
		
	self ffiCall: #(SQLRETURN SQLFreeHandle (SQL_HANDLE_DESC, ODBCSQLDescriptorHandle handle))
	
]
