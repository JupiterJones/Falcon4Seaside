"
Root of the Falcon Component hierarchy.

I implement a version of the Composite pattern that enables a parent / childern relationship to be defined between  subclass instances.

I also understand the concept of a ""selected"" child that refers to one of my direct children.

I have an Announcer and can use the F4SComponentSelectedAnnouncement to set my selectedComponent.
"
Class {
	#name : #F4SCompositeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'components',
		'selectedComponent',
		'announcer'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #'instance creation' }
F4SCompositeComponent class >> parent: aParentComponent [
	^ self new
		parent: aParentComponent;
		yourself
]

{ #category : #accessing }
F4SCompositeComponent >> childOfType: componentClass [
	^ components
		detect: [ :childComponent | childComponent class == componentClass ]
		ifNone: [ nil ]
]

{ #category : #accessing }
F4SCompositeComponent >> children [
	^ super children, components
]

{ #category : #accessing }
F4SCompositeComponent >> componentSelected: aComponentSelectedAnnouncement [
	selectedComponent := aComponentSelectedAnnouncement component
]

{ #category : #accessing }
F4SCompositeComponent >> initialize [
	super initialize.
	components := OrderedCollection new.
	(announcer := Announcer new)
		when: F4SComponentSelected
		send: #componentSelected:
		to: self
]

{ #category : #testing }
F4SCompositeComponent >> isRoot [
	^ parent isNil
]

{ #category : #testing }
F4SCompositeComponent >> isRootOfType [
	"Answer true if my parent is not the same class as me"

	^ parent isNil or: [ self class ~~ parent class ]
]

{ #category : #accessing }
F4SCompositeComponent >> parent: aParentComponent [
	parent := aParentComponent
]

{ #category : #accessing }
F4SCompositeComponent >> pathToRoot [
	^ self isRoot
		ifTrue: [ ^ #(self) ]
		ifFalse: [ parent pathToRoot
				add: self;
				yourself ]
]

{ #category : #accessing }
F4SCompositeComponent >> pathToRootOfType [
	^ self isRootOfType
		ifTrue: [ ^ #(self) ]
		ifFalse: [ parent pathToRootOfType
				add: self;
				yourself ]
]

{ #category : #accessing }
F4SCompositeComponent >> root [
	^ self isRoot ifTrue: [ self ] ifFalse: [ parent root ]
]

{ #category : #accessing }
F4SCompositeComponent >> rootAnouncer [
	^ self root announcer
]

{ #category : #accessing }
F4SCompositeComponent >> selectedComponent [
	^ selectedComponent
]
