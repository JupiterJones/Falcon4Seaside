Class {
	#name : #F4SFalconPricingDefault,
	#superclass : #F4SContentComponent,
	#category : #'Falcon4Seaside-Demo'
}

{ #category : #accessing }
F4SFalconPricingDefault >> faqWidget [
	^ self
		componentAt: #faqWidget
		ifAbsentPut: [ F4SFAQWidget new ]
]

{ #category : #accessing }
F4SFalconPricingDefault >> pricingDefaultWidget [
	^ self
		componentAt: #pricingDefaultWidget
		ifAbsentPut: [ F4SPricingDefaultWidget new ]
]

{ #category : #accessing }
F4SFalconPricingDefault >> renderContentOn: canvas [
	canvas render: self pricingDefaultWidget.
	canvas render: self faqWidget
]
