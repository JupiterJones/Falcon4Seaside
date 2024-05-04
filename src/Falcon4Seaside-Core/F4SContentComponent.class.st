Class {
	#name : #F4SContentComponent,
	#superclass : #F4SCompositeComponent,
	#instVars : [
		'properties',
		'navigationPath'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #properties }
F4SContentComponent class >> defaultBadgeColor [
	^ nil
]

{ #category : #properties }
F4SContentComponent class >> defaultBadgeValue [
	^ nil
]

{ #category : #properties }
F4SContentComponent class >> defaultComment [
	^ nil
]

{ #category : #properties }
F4SContentComponent class >> defaultIcon [
	^ nil
]

{ #category : #properties }
F4SContentComponent class >> defaultIconColor [
	^ nil
]

{ #category : #properties }
F4SContentComponent class >> defaultSubTitle [
	^ nil
]

{ #category : #properties }
F4SContentComponent class >> defaultTitle [
	^ nil
]

{ #category : #properties }
F4SContentComponent class >> defaultTitleColor [
	^ nil
]

{ #category : #properties }
F4SContentComponent >> badgeColor [
	properties at: #badgeColor ifAbsentPut: [ self defaultBadgeColor ]
]

{ #category : #properties }
F4SContentComponent >> badgeColor: aColor [
	properties at: #badgeColor put: aColor
]

{ #category : #properties }
F4SContentComponent >> badgeValue [
	properties at: #badgeValue ifAbsentPut: [ self defaultBadgeValue ]
]

{ #category : #properties }
F4SContentComponent >> badgeValue: aNumber [
	properties at: #badgeValue put: aNumber
]

{ #category : #properties }
F4SContentComponent >> comment [
	properties at: #comment ifAbsentPut: [ self defaultComment ]
]

{ #category : #properties }
F4SContentComponent >> comment: aString [
	properties at: #comment put: aString
]

{ #category : #properties }
F4SContentComponent >> defaultBadgeColor [
	^ self class defaultBadgeColor
]

{ #category : #properties }
F4SContentComponent >> defaultBadgeValue [
	^ self class defaultBadgeValue
]

{ #category : #properties }
F4SContentComponent >> defaultComment [
	^ self class defaultComment
]

{ #category : #properties }
F4SContentComponent >> defaultIcon [
	^ self class defaultIcon
]

{ #category : #properties }
F4SContentComponent >> defaultIconColor [
	^ self class defaultIconColor
]

{ #category : #properties }
F4SContentComponent >> defaultSubTitle [
	^ self class defaultSubTitle
]

{ #category : #properties }
F4SContentComponent >> defaultTitle [
	^ self class defaultTitle
]

{ #category : #properties }
F4SContentComponent >> defaultTitleColor [
	^ self class defaultTitleColor
]

{ #category : #properties }
F4SContentComponent >> icon [
	properties at: #icon ifAbsentPut: [ self defaultIcon ]
]

{ #category : #properties }
F4SContentComponent >> icon: aString [
	properties at: #icon put: aString
]

{ #category : #properties }
F4SContentComponent >> iconColor [
	properties at: #iconColor ifAbsentPut: [ self defaultIconColor ]
]

{ #category : #properties }
F4SContentComponent >> iconColor: aColor [
	properties at: #iconColor put: aColor
]

{ #category : #initialization }
F4SContentComponent >> initialize [
	super initialize.
	properties := GRSmallDictionary new
]

{ #category : #properties }
F4SContentComponent >> subTitle [
	properties at: #subTitle ifAbsentPut: [ self defaultSubTitle ]
]

{ #category : #properties }
F4SContentComponent >> subTitle: aString [
	properties at: #subTitle put: aString
]

{ #category : #properties }
F4SContentComponent >> title [
	properties at: #title ifAbsentPut: [ self defaultTitle ]
]

{ #category : #properties }
F4SContentComponent >> title: aString [
	properties at: #title put: aString
]

{ #category : #properties }
F4SContentComponent >> titleColor [
	properties at: #titleColor ifAbsentPut: [ self defaultTitleColor ]
]

{ #category : #properties }
F4SContentComponent >> titleColor: aColor [
	properties at: #titleColor put: aColor
]
