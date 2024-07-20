Class {
	#name : #F4SPricingDefaultWidget,
	#superclass : #F4SPriceComparison,
	#category : #'Falcon4Seaside-Widgets'
}

{ #category : #accessing }
F4SPricingDefaultWidget >> renderCardBodyOn: canvas [
	canvas div
		class: 'row g-0';
		with: [  ]
]

{ #category : #accessing }
F4SPricingDefaultWidget >> renderContentOn: canvas [
    canvas div class: 'card mb-3'; with: [
        canvas div class: 'card-body'; with: [
            canvas div class: 'row g-0'; with: [
                canvas div class: 'col-12 mb-3'; with: [
                    canvas div class: 'row justify-content-center justify-content-sm-between'; with: [
                        canvas div class: 'col-sm-auto text-center'; with: [
                            canvas heading level: 5; class: 'd-inline-block'; with: 'Billed Annually'.
                            canvas span class: 'badge badge-subtle-success rounded-pill ms-2'; with: 'Save 25%'
                        ].
                        canvas div class: 'col-sm-auto d-flex justify-content-center mt-1 mt-sm-0'; with: [
                            canvas label class: 'form-check-label me-2'; for: 'customSwitch1'; with: 'Monthly'.
                            canvas div class: 'form-check form-switch mb-0'; with: [
                                canvas checkbox class: 'form-check-input falcon-dual-switch'; id: 'customSwitch1'; type: 'checkbox'; attributeAt: 'checked' put: 'checked'.
                                canvas label class: 'form-check-label align-top'; for: 'customSwitch1'; with: 'Yearly'
                            ]
                        ]
                    ]
                ].
                canvas div class: 'col-lg-4 border-top border-bottom'; with: [
                    canvas div class: 'h-100'; with: [
                        canvas div class: 'text-center p-4'; with: [
                            canvas heading level: 3; class: 'fw-normal my-0'; with: 'Single'.
                            canvas paragraph class: 'mt-3'; with: 'For teams that need to create project plans with confidence.'.
                            canvas heading level: 2; class: 'fw-medium my-4'; with: [
                                canvas superscript class: 'fw-normal fs-7 me-1'; with: '&dollar;'.
                                canvas text: '0'.
                                canvas small class: 'fs-10 text-700'; with: '/ year'
                            ].
                            canvas anchor class: 'btn btn-outline-primary'; url: '../../app/e-commerce/billing.html'; with: 'Start free trial'
                        ].
                        canvas horizontalRule class: 'border-bottom-0 m-0'.
                        canvas div class: 'text-start px-sm-4 py-4'; with: [
                            canvas heading level: 5; class: 'fw-medium fs-9'; with: 'Track team projects with free:'.
                            canvas unorderedList class: 'list-unstyled mt-3'; with: [
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Timeline'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Advanced Search'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Custom fields '.
                                    canvas div class: 'badge badge-subtle-success rounded-pill'; with: 'New'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Task dependencies'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Private teams & projects'
                                ]
                            ].
                            canvas anchor class: 'btn btn-link'; url: '#'; with: 'More about Single'
                        ]
                    ]
                ].
                canvas div class: 'col-lg-4 border-top border-bottom dark__bg-1000 px-4 px-lg-0'; style: 'background-color: rgba(115, 255, 236, 0.18);'; with: [
                    canvas div class: 'h-100'; with: [
                        canvas div class: 'text-center p-4'; with: [
                            canvas heading level: 3; class: 'fw-normal my-0'; with: 'Business'.
                            canvas paragraph class: 'mt-3'; with: 'For teams and companies that need to manage work across initiatives.'.
                            canvas heading level: 2; class: 'fw-medium my-4'; with: [
                                canvas superscript class: 'fw-normal fs-7 me-1'; with: '&dollar;'.
                                canvas text: '39'.
                                canvas small class: 'fs-10 text-700'; with: '/ year'
                            ].
                            canvas anchor class: 'btn btn-primary'; url: '../../app/e-commerce/billing.html'; with: 'Get Business'
                        ].
                        canvas horizontalRule class: 'border-bottom-0 m-0'.
                        canvas div class: 'text-start px-sm-4 py-4'; with: [
                            canvas heading level: 5; class: 'fw-medium fs-9'; with: 'Everything in Premium, plus:'.
                            canvas unorderedList class: 'list-unstyled mt-3'; with: [
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Portfolios'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Lock custom fields'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Onboarding plan'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Resource Management'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Lock custom fields'
                                ]
                            ].
                            canvas anchor class: 'btn btn-link'; url: '#'; with: 'More about Business'
                        ]
                    ]
                ].
                canvas div class: 'col-lg-4 border-top border-bottom'; with: [
                    canvas div class: 'h-100'; with: [
                        canvas div class: 'text-center p-4'; with: [
                            canvas heading level: 3; class: 'fw-normal my-0'; with: 'Extended'.
                            canvas paragraph class: 'mt-3'; with: 'For organizations that need additional security and support.'.
                            canvas heading level: 2; class: 'fw-medium my-4'; with: [
                                canvas superscript class: 'fw-normal fs-7 me-1'; with: '&dollar;'.
                                canvas text: '99'.
                                canvas small class: 'fs-10 text-700'; with: '/ year'
                            ].
                            canvas anchor class: 'btn btn-outline-primary'; url: '../../app/e-commerce/billing.html'; with: 'Purchase'
                        ].
                        canvas horizontalRule class: 'border-bottom-0 m-0'.
                        canvas div class: 'text-start px-sm-4 py-4'; with: [
                            canvas heading level: 5; class: 'fw-medium fs-9'; with: 'Everything in Business, plus:'.
                            canvas unorderedList class: 'list-unstyled mt-3'; with: [
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Portfolios'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Tags '.
                                    canvas div class: 'badge badge-subtle-primary rounded-pill'; with: 'Coming soon'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Onboarding plan'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Resource Management'
                                ]
                            ].
                            canvas anchor class: 'btn btn-link'; url: '#'; with: 'More about Extended'
                        ]
                    ]
                ].
                canvas div class: 'col-12 text-center'; with: [
                    canvas heading level: 5; class: 'mt-5'; with: 'Looking for personal or small team task management?'.
                    canvas paragraph class: 'fs-8'; with: [
                        canvas text: 'Try the '.
                        canvas anchor url: '#'; with: 'basic version'.
                        canvas text: ' of Falcon'
                    ]
                ]
            ]
        ]
    ].
]

{ #category : #accessing }
F4SPricingDefaultWidget >> renderOriginalOn: canvas [
    canvas div class: 'card mb-3'; with: [
        canvas div class: 'card-body'; with: [
            canvas div class: 'row g-0'; with: [
                canvas div class: 'col-12 mb-3'; with: [
                    canvas div class: 'row justify-content-center justify-content-sm-between'; with: [
                        canvas div class: 'col-sm-auto text-center'; with: [
                            canvas heading level: 5; class: 'd-inline-block'; with: 'Billed Annually'.
                            canvas span class: 'badge badge-subtle-success rounded-pill ms-2'; with: 'Save 25%'
                        ].
                        canvas div class: 'col-sm-auto d-flex justify-content-center mt-1 mt-sm-0'; with: [
                            canvas label class: 'form-check-label me-2'; for: 'customSwitch1'; with: 'Monthly'.
                            canvas div class: 'form-check form-switch mb-0'; with: [
                                canvas input class: 'form-check-input falcon-dual-switch'; id: 'customSwitch1'; type: 'checkbox'; attributeAt: 'checked' put: 'checked'.
                                canvas label class: 'form-check-label align-top'; for: 'customSwitch1'; with: 'Yearly'
                            ]
                        ]
                    ]
                ].
                canvas div class: 'col-lg-4 border-top border-bottom'; with: [
                    canvas div class: 'h-100'; with: [
                        canvas div class: 'text-center p-4'; with: [
                            canvas heading level: 3; class: 'fw-normal my-0'; with: 'Single'.
                            canvas paragraph class: 'mt-3'; with: 'For teams that need to create project plans with confidence.'.
                            canvas heading level: 2; class: 'fw-medium my-4'; with: [
                                canvas superscript class: 'fw-normal fs-7 me-1'; with: '&dollar;'.
                                canvas text: '0'.
                                canvas small class: 'fs-10 text-700'; with: '/ year'
                            ].
                            canvas anchor class: 'btn btn-outline-primary'; url: '../../app/e-commerce/billing.html'; with: 'Start free trial'
                        ].
                        canvas horizontalRule class: 'border-bottom-0 m-0'.
                        canvas div class: 'text-start px-sm-4 py-4'; with: [
                            canvas heading level: 5; class: 'fw-medium fs-9'; with: 'Track team projects with free:'.
                            canvas unorderedList class: 'list-unstyled mt-3'; with: [
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Timeline'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Advanced Search'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Custom fields '.
                                    canvas div class: 'badge badge-subtle-success rounded-pill'; with: 'New'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Task dependencies'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Private teams & projects'
                                ]
                            ].
                            canvas anchor class: 'btn btn-link'; url: '#'; with: 'More about Single'
                        ]
                    ]
                ].
                canvas div class: 'col-lg-4 border-top border-bottom dark__bg-1000 px-4 px-lg-0'; style: 'background-color: rgba(115, 255, 236, 0.18);'; with: [
                    canvas div class: 'h-100'; with: [
                        canvas div class: 'text-center p-4'; with: [
                            canvas heading level: 3; class: 'fw-normal my-0'; with: 'Business'.
                            canvas paragraph class: 'mt-3'; with: 'For teams and companies that need to manage work across initiatives.'.
                            canvas heading level: 2; class: 'fw-medium my-4'; with: [
                                canvas superscript class: 'fw-normal fs-7 me-1'; with: '&dollar;'.
                                canvas text: '39'.
                                canvas small class: 'fs-10 text-700'; with: '/ year'
                            ].
                            canvas anchor class: 'btn btn-primary'; url: '../../app/e-commerce/billing.html'; with: 'Get Business'
                        ].
                        canvas horizontalRule class: 'border-bottom-0 m-0'.
                        canvas div class: 'text-start px-sm-4 py-4'; with: [
                            canvas heading level: 5; class: 'fw-medium fs-9'; with: 'Everything in Premium, plus:'.
                            canvas unorderedList class: 'list-unstyled mt-3'; with: [
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Portfolios'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Lock custom fields'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Onboarding plan'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Resource Management'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Lock custom fields'
                                ]
                            ].
                            canvas anchor class: 'btn btn-link'; url: '#'; with: 'More about Business'
                        ]
                    ]
                ].
                canvas div class: 'col-lg-4 border-top border-bottom'; with: [
                    canvas div class: 'h-100'; with: [
                        canvas div class: 'text-center p-4'; with: [
                            canvas heading level: 3; class: 'fw-normal my-0'; with: 'Extended'.
                            canvas paragraph class: 'mt-3'; with: 'For organizations that need additional security and support.'.
                            canvas heading level: 2; class: 'fw-medium my-4'; with: [
                                canvas superscript class: 'fw-normal fs-7 me-1'; with: '&dollar;'.
                                canvas text: '99'.
                                canvas small class: 'fs-10 text-700'; with: '/ year'
                            ].
                            canvas anchor class: 'btn btn-outline-primary'; url: '../../app/e-commerce/billing.html'; with: 'Purchase'
                        ].
                        canvas horizontalRule class: 'border-bottom-0 m-0'.
                        canvas div class: 'text-start px-sm-4 py-4'; with: [
                            canvas heading level: 5; class: 'fw-medium fs-9'; with: 'Everything in Business, plus:'.
                            canvas unorderedList class: 'list-unstyled mt-3'; with: [
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Portfolios'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Tags '.
                                    canvas div class: 'badge badge-subtle-primary rounded-pill'; with: 'Coming soon'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Onboarding plan'
                                ].
                                canvas listItem class: 'py-1'; with: [
                                    canvas span class: 'me-2 fas fa-check text-success'; with: ' '.
                                    canvas text: ' Resource Management'
                                ]
                            ].
                            canvas anchor class: 'btn btn-link'; url: '#'; with: 'More about Extended'
                        ]
                    ]
                ].
                canvas div class: 'col-12 text-center'; with: [
                    canvas heading level: 5; class: 'mt-5'; with: 'Looking for personal or small team task management?'.
                    canvas paragraph class: 'fs-8'; with: [
                        canvas text: 'Try the '.
                        canvas anchor; url: '#'; with: 'basic version'.
                        canvas text: ' of Falcon'
                    ]
                ]
            ]
        ]
    ].
]
