Class {
	#name : #F4SLandingComponent,
	#superclass : #F4SCompositeComponent,
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SLandingComponent >> renderBodyScriptsOn: canvas [
	canvas script url: F4SFalconDemoFileLibrary / #'vendorstypedjstypedumdJs'
]

{ #category : #rendering }
F4SLandingComponent >> renderContentOn: canvas [
	self
		renderOpeningSectionOn: canvas;
		renderSupportersOn: canvas;
		renderFeaturesOn: canvas;
		renderSummaryPointsOn: canvas;
		renderBodyScriptsOn: canvas
]

{ #category : #accessing }
F4SLandingComponent >> renderFeaturesOn: canvas [
	canvas section
		with: [ canvas div
				class: 'container';
				with: [ canvas div
						class: 'row justify-content-center text-center';
						with: [ canvas div
								class: 'col-lg-8 col-xl-7 col-xxl-6';
								with: [ canvas heading
										level1;
										class: 'fs-7 fs-sm-5 fs-md-4';
										with: [ canvas text: 'WebApp theme of the future' ].
									canvas paragraph
										class: 'lead';
										with: [ canvas
												text: 'Built on top of Bootstrap 5, super modular Falcon provides you gorgeous design &amp; streamlined UX for your WebApp.' ] ] ].
					canvas div
						class: 'row flex-center mt-8';
						with: [ canvas div
								class: 'col-md col-lg-5 col-xl-4 ps-lg-6';
								with: [ canvas image
										class: 'img-fluid px-6 px-md-0';
										url: F4SFalconDemoFileLibrary / #imgiconsspotillustrations50Png ].
							canvas div
								class: 'col-md col-lg-5 col-xl-4 mt-4 mt-md-0';
								with: [ canvas heading
										level5;
										class: 'text-danger';
										with: [ canvas span class: 'far fa-lightbulb me-2'.
											canvas text: 'PLAN' ].
									canvas heading
										level3;
										with: [ canvas text: 'Blueprint & Design' ].
									canvas paragraph
										with: [ canvas
												text: 'With Falcon as your guide, now you have a fine-tuned state of the earth tool to make your wireframe a reality' ] ] ].

					canvas div
						class: 'row flex-center mt-7';
						with: [ canvas div
								class: 'col-md col-lg-5 col-xl-4 pe-lg-6 order-md-2';
								with: [ canvas image
										class: 'img-fluid px-6 px-md-0';
										url: F4SFalconDemoFileLibrary / #imgiconsspotillustrations49Png ].

							canvas div
								class: 'col-md col-lg-5 col-xl-4 mt-4 mt-md-0';
								with: [ canvas heading
										level5;
										class: 'text-info';
										with: [ canvas span class: 'far fa-object-ungroup me-2'.
											canvas text: 'BUILD' ].
									canvas heading
										level3;
										with: [ canvas text: '38 Sets of components' ].
									canvas paragraph
										with: [ canvas
												text: 'Build any UI effortlessly with Falcon''s robust set of layouts, 38 sets of built-in elements, carefully chosen colors, typography, and css helpers.' ] ] ].

					canvas div
						class: 'row flex-center mt-7';
						with: [ canvas div
								class: 'col-md col-lg-5 col-xl-4 ps-lg-6';
								with: [ canvas image
										class: 'img-fluid px-6 px-md-0';
										url: F4SFalconDemoFileLibrary / #imgiconsspotillustrations48Png ].

							canvas div
								class: 'col-md col-lg-5 col-xl-4 mt-4 mt-md-0';
								with: [ canvas heading
										level5;
										class: 'text-success';
										with: [ canvas span class: 'far fa-paper-plane me-2'.
											canvas text: 'DEPLOY' ].
									canvas heading
										level3;
										with: [ canvas text: 'Review and test' ].
									canvas paragraph
										with: [ canvas
												text: 'From IE to iOS, rigorously tested and optimized Falcon will give the near perfect finishing to your webapp; from the landing page to the logout screen.' ] ] ] ] ]
]

{ #category : #rendering }
F4SLandingComponent >> renderOpeningSectionOn: canvas [
	canvas section
		class: 'py-0 overflow-hidden';
		id: 'banner';
		attributeAt: 'data-bs-theme' put: (self application configuration at: #theme);
		with: [ canvas div
				class: 'bg-holder overlay';
				style: 'background-image:url('
						, (F4SFalconDemoFileLibrary / #imggenericbg1Jpg) asString
						, ');background-position: center bottom;'.
			canvas div
				class: 'container';
				with: [ canvas div
						class: 'row flex-center pt-8 pt-lg-10 pb-lg-9 pb-xl-0';
						with: [ canvas div
								class: 'col-md-11 col-lg-8 col-xl-4 pb-7 pb-xl-9 text-center text-xl-start';
								with: [ canvas anchor
										class: 'btn btn-outline-danger mb-4 fs-10 border-2 rounded-pill';
										url: '#';
										with: [ canvas span
												class: 'me-2';
												attributeAt: 'role' put: 'img';
												attributeAt: 'aria-label' put: 'Gift';
												with: [ canvas text: '🎁' ].
											canvas text: 'Become a Pro' ].
									canvas heading
										level1;
										class: 'text-white fw-light';
										with: [ canvas text: 'Bring '.
											canvas span
												class: 'typed-text fw-bold';
												attributeAt: 'data-typed-text'
													put: (NeoJSONArray
															with: 'design'
															with: 'beauty'
															with: 'elegance'
															with: 'perfection').
											canvas
												break;
												text: ' to your webapp' ].
									canvas paragraph
										class: 'lead text-white opacity-75';
										with: [ canvas
												text: 'With the power of Falcon, you can now focus only on functionaries for your digital products, while leaving the UI design on us!' ].
									canvas anchor
										class: 'btn btn-outline-light border-2 rounded-pill btn-lg mt-4 fs-9 py-2';
										url: '#';
										with: [ canvas text: 'Start building with the falcon'.
											canvas span
												class: 'fas fa-play ms-2';
												attributeAt: 'data-fa-transform' put: 'shrink-6 down-1' ] ].
							canvas div
								class: 'col-xl-7 offset-xl-1 align-self-end mt-4 mt-xl-0';
								with: [ canvas anchor
										class: 'img-landing-banner rounded';
										url: '#';
										with: [ canvas image
												class: 'img-fluid d-dark-none';
												url: F4SFalconDemoFileLibrary / #imggenericdashboardaltJpg.
											canvas image
												class: 'img-fluid d-light-none';
												url: F4SFalconDemoFileLibrary / #imggenericdashboardaltdarkPng ] ] ] ] ]
]

{ #category : #accessing }
F4SLandingComponent >> renderSummaryPointsOn: canvas [
	canvas section
		class: 'bg-body-tertiary dark__bg-opacity-50 text-center';
		with: [ canvas div
				class: 'container';
				with: [ canvas div
						class: 'row';
						with: [ canvas div
								class: 'col';
								with: [ canvas heading
										level1;
										class: 'fs-7 fs-sm-5 fs-md-4';
										with: [ canvas text: 'Here''s what''s in it for you' ].
									canvas paragraph
										class: 'lead';
										with: [ canvas text: 'Things you will get right out of the box with Falcon.' ] ] ].
					canvas div
						class: 'row mt-6';
						with: [ canvas div
								class: 'col-lg-4';
								with: [ canvas div
										class: 'card card-span h-100';
										with: [ canvas div
												class: 'card-span-img';
												with: [ canvas div class: 'fab fa-sass fs-5 text-info' ].
											canvas div
												class: 'card-body pt-6 pb-4';
												with: [ canvas heading
														level5;
														class: 'mb-2';
														with: [ canvas text: 'Bootstrap 5.x' ].
													canvas paragraph
														with: [ canvas
																text: 'Build your webapp with the world''s most popular front-end component library along with Falcon''s 32 sets of carefully designed elements.' ] ] ] ].

							canvas div
								class: 'col-lg-4';
								with: [ canvas div
										class: 'card card-span h-100';
										with: [ canvas div
												class: 'card-span-img';
												with: [ canvas div class: 'fab fa-node-js fs-5 text-info' ].
											canvas div
												class: 'card-body pt-6 pb-4';
												with: [ canvas heading
														level5;
														class: 'mb-2';
														with: [ canvas text: 'SCSS & Javascript files' ].
													canvas paragraph
														with: [ canvas
																text: 'With your purchased copy of Falcon, you will get all the uncompressed & documented SCSS and Javascript source code files.' ] ] ] ].
							canvas div
								class: 'col-lg-4';
								with: [ canvas div
										class: 'card card-span h-100';
										with: [ canvas div
												class: 'card-span-img';
												with: [ canvas div class: 'fab fa-gulp fs-5 text-info' ].
											canvas div
												class: 'card-body pt-6 pb-4';
												with: [ canvas heading
														level5;
														class: 'mb-2';
														with: [ canvas text: 'Gulp based workflow' ].
													canvas paragraph
														with: [ canvas
																text: 'All the painful or time-consuming tasks in your development workflow such as compiling the SCSS or transpiring the JS are automated.' ] ] ] ] ] ] ]
]

{ #category : #accessing }
F4SLandingComponent >> renderSupportersOn: canvas [
	canvas section
		class: 'py-3 bg-body-tertiary shadow-sm';
		with: [ canvas div
				class: 'container';
				with: [ canvas div
						class: 'row flex-center';
						with: [ {#'imglogosbw6Png' -> 40.
								#'imglogosbw11Png' -> 45.
								#'imglogosbw2Png' -> 30.
								#'imglogosbw4Png' -> 30.
								#'imglogosbw1Png' -> 35.
								#'imglogosbw10Png' -> 40.
								#'imglogosbw12Png' -> 40}
								do: [ :image | 
									canvas div
										class: 'col-3 col-sm-auto my-1 my-sm-3 px-x1';
										with: [ canvas image
												class: 'landing-cta-img';
												height: image value;
												url: F4SFalconDemoFileLibrary / image key ] ] ] ] ]
]
