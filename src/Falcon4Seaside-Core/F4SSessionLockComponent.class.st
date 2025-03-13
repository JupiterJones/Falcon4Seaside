Class {
	#name : #F4SSessionLockComponent,
	#superclass : #F4SContentComponent,
	#instVars : [
		'lockUser'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SSessionLockComponent >> lockUser [
	^ lockUser
]

{ #category : #accessing }
F4SSessionLockComponent >> lockUser: anObject [
	lockUser := anObject
]

{ #category : #'as yet unclassified' }
F4SSessionLockComponent >> renderContentOn: canvas [
	canvas div
		class: 'row min-vh-100 flex-center g-0';
		with: [ canvas div
				class: 'col-lg-8 col-xxl-5 py-3 position-relative';
				with: [ canvas image
						class: 'bg-auth-circle-shape';
						url: F4SFalconDemoFileLibrary / #imgiconsspotillustrationsbgshapePng;
						attributeAt: 'alt' put: '';
						attributeAt: 'width' put: '250'.
					canvas image
						class: 'bg-auth-circle-shape-2';
						url: F4SFalconDemoFileLibrary / #imgiconsspotillustrationsshape1Png;
						attributeAt: 'alt' put: '';
						attributeAt: 'width' put: '150'.

					canvas div
						class: 'card overflow-hidden z-1';
						with: [ canvas div
								class: 'card-body p-0';
								with: [ canvas div
										class: 'row g-0 h-100';
										with: [ canvas div
												class: 'col-md-5 text-center bg-card-gradient';
												with: [ canvas div
														class: 'position-relative p-4 pt-md-5 pb-md-7';
														attributeAt: 'data-bs-theme' put: 'light';
														with: [ canvas div
																class: 'bg-holder bg-auth-card-shape';
																style: 'background-image:url(' , (F4SFalconDemoFileLibrary / #imgiconsspotillustrationshalfcirclePng) asString
																		, ');'.
															canvas div
																class: 'z-1 position-relative';
																with: [ canvas anchor
																		class: 'link-light mb-4 font-sans-serif fs-5 d-inline-block fw-bolder';
																		url: '../../../index.html';
																		with: [ canvas text: 'falcon' ].
																	canvas paragraph
																		class: 'opacity-75 text-white';
																		with: [ canvas
																				text: 'With the power of Falcon, you can now focus only on functionaries for your digital products, while leaving the UI design on us!' ] ] ].
													canvas div
														class: 'mt-3 mb-4 mt-md-4 mb-md-5';
														attributeAt: 'data-bs-theme' put: 'light';
														with: [ canvas paragraph
																class: 'mb-0 mt-4 mt-md-5 fs-10 fw-semi-bold text-white opacity-75';
																with: [ canvas text: 'Read our '.
																	canvas anchor
																		class: 'text-decoration-underline text-white';
																		url: '#!';
																		with: [ canvas text: 'terms' ].
																	canvas text: ' and '.
																	canvas anchor
																		class: 'text-decoration-underline text-white';
																		url: '#!';
																		with: [ canvas text: 'conditions' ] ] ] ] ].

									canvas div
										class: 'col-md-7 d-flex flex-center';
										with: [ canvas div
												class: 'p-4 p-md-5 flex-grow-1';
												with: [ canvas div
														class: 'row justify-content-center';
														with: [ canvas div
																class: 'col-auto';
																with: [ canvas div
																		class: 'd-flex align-items-center';
																		with: [ canvas div
																				class: 'avatar avatar-4xl me-4';
																				with: [ canvas image
																						class: 'rounded-circle';
																						url: F4SFalconDemoFileLibrary / #imgteam1Jpg;
																						attributeAt: 'alt' put: '' ].
																			canvas div
																				class: 'flex-1';
																				with: [ canvas heading
																						level: 4;
																						with: [ canvas text: 'Hi! Emma' ].
																					canvas paragraph
																						class: 'mb-0';
																						with: [ canvas
																								text: 'Enter your password ';
																								break;
																								text: 'to access the admin.' ] ] ].
																	canvas form
																		class: 'mt-4 row gx-2';
																		with: [ canvas div
																				class: 'col';
																				with: [ canvas input
																						class: 'form-control';
																						type: 'password';
																						attributeAt: 'placeholder' put: 'Password';
																						attributeAt: 'aria-label' put: 'Password';
																						attributeAt: 'aria-describedby' put: 'user-password' ].
																			canvas div
																				class: 'col-4';
																				with: [ canvas button
																						class: 'btn btn-primary d-block w-100';
																						id: 'user-password';
																						type: 'button';
																						with: [ canvas text: 'Login' ] ] ] ] ] ] ] ] ] ] ]
]
