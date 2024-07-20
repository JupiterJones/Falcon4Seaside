Class {
	#name : #F4SFalconPricingAlt,
	#superclass : #F4SContentComponent,
	#category : #'Falcon4Seaside-Demo'
}

{ #category : #accessing }
F4SFalconPricingAlt >> faqWidget [
	^ self
		componentAt: #faqWidget
		ifAbsentPut: [ F4SFAQWidget new ]
]

{ #category : #accessing }
F4SFalconPricingAlt >> pricingAltWidget [
	^ self
		componentAt: #pricingDefaultWidget
		ifAbsentPut: [ F4SPricingAlternateWidget new ]
]

{ #category : #accessing }
F4SFalconPricingAlt >> renderContentOn: canvas [
	canvas render: self pricingAltWidget.
	canvas render: self faqWidget
]
