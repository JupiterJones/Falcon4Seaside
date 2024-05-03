"
Root of the Falcon Component hierarchy.
"
Class {
	#name : #F4SAbstractComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'icon',
		'label',
		'badge',
		'tags',
		'accessKey'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #'instance creation' }
F4SAbstractComponent class >> parent: aParentComponent [
	^ self new
		parent: aParentComponent;
		yourself
]

{ #category : #accessing }
F4SAbstractComponent >> initialize [
	super initialize
]

{ #category : #testing }
F4SAbstractComponent >> isRoot [
	^ parent isNil
]

{ #category : #testing }
F4SAbstractComponent >> isRootOfType [
	"Answer true if my parent is not the same class as me"
	^ self class ~~parent class
]

{ #category : #accessing }
F4SAbstractComponent >> parent: aParentComponent [
	parent := aParentComponent
]

{ #category : #accessing }
F4SAbstractComponent >> pathToRoot [
	^ self isRoot
		ifTrue: [ ^ #(self) ]
		ifFalse: [ parent pathToRoot
				add: self;
				yourself ]
]

{ #category : #accessing }
F4SAbstractComponent >> pathToRootOfType [
	^ self isRootOfType
		ifTrue: [ ^ #(self) ]
		ifFalse: [ parent pathToRootOfType
				add: self;
				yourself ]
]

{ #category : #accessing }
F4SAbstractComponent >> root [
	^ self isRoot ifTrue: [ self ] ifFalse: [ parent root ]
]
