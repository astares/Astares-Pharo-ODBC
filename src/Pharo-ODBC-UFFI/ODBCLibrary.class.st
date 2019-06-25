"
The ODBC library
"
Class {
	#name : #ODBCLibrary,
	#superclass : #FFILibrary,
	#category : #'Pharo-ODBC-UFFI-UFFI-Library'
}

{ #category : #'accessing platform' }
ODBCLibrary >> macModuleName [ 
	"Create symlink in terminal (see http://www.iodbc.org)
	    sudo ln -s /usr/lib/libiodbc.dylib /usr/lib/libodbc.so
	"

	^ 'libiodbc.dylib'
]

{ #category : #'accessing platform' }
ODBCLibrary >> unixModuleName [
  
	^ 'libodbc.so'
]

{ #category : #'accessing platform' }
ODBCLibrary >> win32ModuleName [ 

	^ 'odbc32.dll'
]
