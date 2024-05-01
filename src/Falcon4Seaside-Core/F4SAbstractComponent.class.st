Class {
	#name : #F4SAbstractComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'properties'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SAbstractComponent >> initialize [
	super initialize.
	properties := Dictionary new.
	components := OrderedCollection new.
]
