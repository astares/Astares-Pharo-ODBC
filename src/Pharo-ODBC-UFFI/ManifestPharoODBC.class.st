"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPharoODBC,
	#superclass : #PackageManifest,
	#category : #'Pharo-ODBC-UFFI-Manifest'
}

{ #category : #'code-critics' }
ManifestPharoODBC class >> ruleRBLiteralArrayContainsCommaRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'Pharo-ODBC')) #'2019-06-02T17:05:15.359384+02:00') )
]
