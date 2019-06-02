"
The ODBC library
"
Class {
	#name : #ODBCLibrary,
	#superclass : #FFILibrary,
	#category : #'Pharo-ODBC-UFFI'
}

{ #category : #'accessing platform' }
ODBCLibrary >> win32ModuleName [ 
	^ 'odbc32.dll'
]
