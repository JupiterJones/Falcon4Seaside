Class {
	#name : #F4SDefaultDashboard,
	#superclass : #F4SDashboardComponent,
	#category : #'Falcon4Seaside-Demo'
}

{ #category : #accessing }
F4SDefaultDashboard >> renderContentOn: canvas [
	canvas paragraph: 'This is the default dashboard'
]
