Class {
	#name : #F4SFalconDemoRoot,
	#superclass : #F4SRootComponent,
	#category : #'Falcon4Seaside-Demo'
}

{ #category : #accessing }
F4SFalconDemoRoot class >> applicationName [
	^ 'falcon'
]

{ #category : #accessing }
F4SFalconDemoRoot class >> fileLibraryClass [
	^ F4SFalconDemoFileLibrary
]

{ #category : #accessing }
F4SFalconDemoRoot class >> windowTitle [
	^ 'Falcon | Dashboard & Web App Template'
]

{ #category : #accessing }
F4SFalconDemoRoot >> adminComponent [
	^ self componentAt: #admin ifAbsentPut: [ F4SFalconDemoAdmin parent: self ]
]

{ #category : #accessing }
F4SFalconDemoRoot >> initialComponent [
	^ self adminComponent
]
