Class {
	#name : #F4SFAQWidget,
	#superclass : #F4SWidget,
	#category : #'Falcon4Seaside-Widgets'
}

{ #category : #accessing }
F4SFAQWidget >> renderCardBodyOn: canvas [
	^ canvas div
		class: 'row';
		class: 'g-0' if: self justifyContentCenter not;
		class: 'justify-content-center' if: self justifyContentCenter;
		with: [  ]
]

{ #category : #accessing }
F4SFAQWidget >> renderContentOn: canvas [
	canvas div
		class: 'card mb-3';
		with: [ canvas div
				class: 'card-body';
				with: [ self renderCardBodyOn: canvas ] ]
]
