Class {
	#name : #F4SAbstractPanel,
	#superclass : #F4SAbstractComponent,
	#instVars : [
		'announcer',
		'components',
		'selectedComponent'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SAbstractPanel >> childOfType: componentClass [
	^ components
		detect: [ :childComponent | childComponent class == componentClass ]
		ifNone: [ nil ]
]

{ #category : #accessing }
F4SAbstractPanel >> children [
	^ super children, components
]

{ #category : #accessing }
F4SAbstractPanel >> componentSelected: aComponentSelectedAnnouncement [
	selectedComponent := aComponentSelectedAnnouncement component
]

{ #category : #initialization }
F4SAbstractPanel >> initialize [
	(announcer := Announcer new)
		subscribe: F4SComponentSelected
		send: #componentSelected:
		to: self
]

{ #category : #accessing }
F4SAbstractPanel >> rootAnouncer [
	^ self root announcer
]

{ #category : #accessing }
F4SAbstractPanel >> selectedComponent [
	^ selectedComponent
]
