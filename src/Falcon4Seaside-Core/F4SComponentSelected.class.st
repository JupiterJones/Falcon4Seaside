Class {
	#name : #F4SComponentSelected,
	#superclass : #F4SAnnouncement,
	#instVars : [
		'component'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #'instance creation' }
F4SComponentSelected class >> component: aComponent [
	^ self new
		component: aComponent;
		yourself
]

{ #category : #accessing }
F4SComponentSelected >> component [
	^ component
]

{ #category : #accessing }
F4SComponentSelected >> component: aComponent [
	component := aComponent
]
