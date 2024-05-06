Class {
	#name : #F4SNavItem,
	#superclass : #Object,
	#instVars : [
		'parent',
		'children',
		'component',
		'properties'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #properties }
F4SNavItem class >> defaultBadgeColor [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultBadgeValue [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultColumn [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultComment [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultIcon [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultIconColor [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultIsGroup [
	^ false
]

{ #category : #properties }
F4SNavItem class >> defaultIsVisible [
	^ true
]

{ #category : #properties }
F4SNavItem class >> defaultPromoteChildrenInVertical [
	^ false
]

{ #category : #properties }
F4SNavItem class >> defaultRow [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultSubTitle [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultTitle [
	^ nil
]

{ #category : #properties }
F4SNavItem class >> defaultTitleColor [
	^ nil
]

{ #category : #actions }
F4SNavItem >> addChild: aNavItem [
	children add: aNavItem
]

{ #category : #properties }
F4SNavItem >> badgeColor [
	^ properties at: #badgeColor ifAbsentPut: [ self defaultBadgeColor ]
]

{ #category : #properties }
F4SNavItem >> badgeColor: aColor [
	properties at: #badgeColor put: aColor
]

{ #category : #properties }
F4SNavItem >> badgeValue [
	^ properties at: #badgeValue ifAbsentPut: [ self defaultBadgeValue ]
]

{ #category : #properties }
F4SNavItem >> badgeValue: aNumber [
	properties at: #badgeValue put: aNumber
]

{ #category : #actions }
F4SNavItem >> beGroup [
	self isGroup: true
]

{ #category : #actions }
F4SNavItem >> beHidden [
	self isVisible: false
]

{ #category : #accessing }
F4SNavItem >> children [
	^ children
]

{ #category : #properties }
F4SNavItem >> column [
	^ properties at: #column ifAbsentPut: [ self defaultColumn ]
]

{ #category : #properties }
F4SNavItem >> column: anInteger [
	properties at: #column put: anInteger
]

{ #category : #properties }
F4SNavItem >> comment [
	^ properties at: #comment ifAbsentPut: [ self defaultComment ]
]

{ #category : #properties }
F4SNavItem >> comment: aString [
	properties at: #comment put: aString
]

{ #category : #accessing }
F4SNavItem >> component [
	^ component
]

{ #category : #accessing }
F4SNavItem >> component: aComponent [
	component := aComponent
			navItem: self;
			yourself
]

{ #category : #properties }
F4SNavItem >> defaultBadgeColor [
	^ self class defaultBadgeColor
]

{ #category : #properties }
F4SNavItem >> defaultBadgeValue [
	^ self class defaultBadgeValue
]

{ #category : #properties }
F4SNavItem >> defaultColumn [
	^ self class defaultColumn
]

{ #category : #properties }
F4SNavItem >> defaultComment [
	^ self class defaultComment
]

{ #category : #properties }
F4SNavItem >> defaultIcon [
	^ self class defaultIcon
]

{ #category : #properties }
F4SNavItem >> defaultIconColor [
	^ self class defaultIconColor
]

{ #category : #properties }
F4SNavItem >> defaultIsGroup [
	^ self class defaultIsGroup
]

{ #category : #properties }
F4SNavItem >> defaultIsVisible [
	^ self class defaultIsVisible
]

{ #category : #properties }
F4SNavItem >> defaultPromoteChildrenInVertical [
	^ self class defaultPromoteChildrenInVertical
]

{ #category : #properties }
F4SNavItem >> defaultRow [
	^ self class defaultRow
]

{ #category : #properties }
F4SNavItem >> defaultSubTitle [
	^ self class defaultSubTitle
]

{ #category : #properties }
F4SNavItem >> defaultTitle [
	^ self class defaultTitle
]

{ #category : #properties }
F4SNavItem >> defaultTitleColor [
	^ self class defaultTitleColor
]

{ #category : #properties }
F4SNavItem >> hasProperty: aKey [
	^ properties includesKey: aKey
]

{ #category : #properties }
F4SNavItem >> icon [
	^ properties at: #icon ifAbsentPut: [ self defaultIcon ]
]

{ #category : #properties }
F4SNavItem >> icon: aString [
	properties at: #icon put: aString
]

{ #category : #properties }
F4SNavItem >> iconColor [
	^ properties at: #iconColor ifAbsentPut: [ self defaultIconColor ]
]

{ #category : #properties }
F4SNavItem >> iconColor: aColor [
	properties at: #iconColor put: aColor
]

{ #category : #initialization }
F4SNavItem >> initialize [
	super initialize.
	children := OrderedCollection new.
	properties := Dictionary new
]

{ #category : #properties }
F4SNavItem >> isGroup [
	^ properties at: #isGroup ifAbsentPut: [ self defaultIsGroup ]
]

{ #category : #properties }
F4SNavItem >> isGroup: aBoolean [
	properties at: #isGroup put: aBoolean
]

{ #category : #properties }
F4SNavItem >> isVisible [
	"Show in menus"
	^ properties at: #isVisible ifAbsentPut: [ self defaultIsVisible ]
]

{ #category : #properties }
F4SNavItem >> isVisible: aBoolean [
	properties at: #isVisible put: aBoolean
]

{ #category : #accessing }
F4SNavItem >> parent [
	^ parent
]

{ #category : #accessing }
F4SNavItem >> parent: aParent [
	parent := aParent
]

{ #category : #properties }
F4SNavItem >> promoteChildrenInVertical [
	"Promote children up a level on the vertical navigation and remove myself"
	^ properties at: #promoteChildrenInVertical ifAbsentPut: [ self defaultPromoteChildrenInVertical ]
]

{ #category : #properties }
F4SNavItem >> promoteChildrenInVertical: aBoolean [
	properties at: #promoteChildrenInVertical put: aBoolean
]

{ #category : #properties }
F4SNavItem >> row [
	^ properties at: #row ifAbsentPut: [ self defaultRow ]
]

{ #category : #properties }
F4SNavItem >> row: anInteger [
	properties at: #row put: anInteger
]

{ #category : #navigation }
F4SNavItem >> row: rowInteger column: columnInteger [
	self
		row: rowInteger;
		column: columnInteger
]

{ #category : #properties }
F4SNavItem >> subTitle [
	^ properties at: #subTitle ifAbsentPut: [ self defaultSubTitle ]
]

{ #category : #properties }
F4SNavItem >> subTitle: aString [
	properties at: #subTitle put: aString
]

{ #category : #properties }
F4SNavItem >> title [
	^ properties at: #title ifAbsentPut: [ self defaultTitle ]
]

{ #category : #properties }
F4SNavItem >> title: aString [
	properties at: #title put: aString
]

{ #category : #properties }
F4SNavItem >> titleColor [
	^ properties at: #titleColor ifAbsentPut: [ self defaultTitleColor ]
]

{ #category : #properties }
F4SNavItem >> titleColor: aColor [
	properties at: #titleColor put: aColor
]
