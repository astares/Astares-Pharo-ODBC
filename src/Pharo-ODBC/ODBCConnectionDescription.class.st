"
Instances of this class represent a connection description

 environment      - an ODBCSQLEnvironment
 dataSourceName   - the data source name (DSN) of the connection
 username         - the username
 password         - the password

Instances use a default environment as given in the settings.
 
"
Class {
	#name : #ODBCConnectionDescription,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'dataSourceName',
		'odbcVersion'
	],
	#classVars : [
		'DefaultODBCVersion'
	],
	#category : #'Pharo-ODBC-Base'
}

{ #category : #accessing }
ODBCConnectionDescription class >> availableODBCVersions [

	^self odbcEnvironmentMapping keys
]

{ #category : #accessing }
ODBCConnectionDescription class >> defaultODBCVersion [

	^DefaultODBCVersion ifNil: [ DefaultODBCVersion := self availableODBCVersions third ]
]

{ #category : #accessing }
ODBCConnectionDescription class >> defaultODBCVersion: aSymbol [

	DefaultODBCVersion := aSymbol
]

{ #category : #'private - accessing' }
ODBCConnectionDescription class >> odbcEnvironmentMapping [
	"A mapping from displayable Strings for ODBC versions to class method selectors of 
	 ODBCSQLEnvironment class"

	^{ #'ODBC 2' 	 -> #forODBC2.
	   #'ODBC 3' 	 -> #forODBC3.
	   #'ODBC 3.80' -> #forODBC3_80. 
		#'ODBC 4' 	 -> #forODBC4.
	} asDictionary
]

{ #category : #'initialization-release' }
ODBCConnectionDescription class >> reset [ 
	<script>
	
	DefaultODBCVersion := nil
]

{ #category : #accessing }
ODBCConnectionDescription >> dataSourceName [
	^ dataSourceName
]

{ #category : #accessing }
ODBCConnectionDescription >> dataSourceName: anObject [
	dataSourceName := anObject
]

{ #category : #'private - accessing' }
ODBCConnectionDescription >> environmentClass [

	^ODBCSQLEnvironment 
]

{ #category : #initialization }
ODBCConnectionDescription >> initialize [

	super initialize.
	odbcVersion := self class defaultODBCVersion
]

{ #category : #'private - initialization' }
ODBCConnectionDescription >> instantiateODBCEnvironment [
	"Instantiate a default ODBC Environment instance depending on class side (global) setting"
	
	^self environmentClass perform: (self class odbcEnvironmentMapping at: self odbcVersion)
]

{ #category : #accessing }
ODBCConnectionDescription >> odbcVersion [
	^ odbcVersion
]

{ #category : #accessing }
ODBCConnectionDescription >> odbcVersion: anObject [
	odbcVersion := anObject
]

{ #category : #accessing }
ODBCConnectionDescription >> password [
	^ password
]

{ #category : #accessing }
ODBCConnectionDescription >> password: anObject [
	password := anObject
]

{ #category : #accessing }
ODBCConnectionDescription >> username [
	^ username
]

{ #category : #accessing }
ODBCConnectionDescription >> username: anObject [
	username := anObject
]
