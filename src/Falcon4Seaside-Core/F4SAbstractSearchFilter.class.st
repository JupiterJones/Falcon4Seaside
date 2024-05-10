Class {
	#name : #F4SAbstractSearchFilter,
	#superclass : #Object,
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SAbstractSearchFilter >> applyInScope: aCollection [
	^ self resultType new
		addAll: (self defaultFilterScope select: [ :item | self matches: item ])
]

{ #category : #accessing }
F4SAbstractSearchFilter >> defaultFilterScope [
	"Answer a collection with the objects in scope"
	^ self subclassResponsibility
]

{ #category : #testing }
F4SAbstractSearchFilter >> matches: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
F4SAbstractSearchFilter >> result [
	^ self applyInScope: self defaultFilterScope
]

{ #category : #accessing }
F4SAbstractSearchFilter >> resultType [
	^ OrderedCollection
]
