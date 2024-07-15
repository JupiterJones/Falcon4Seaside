Class {
	#name : #F4SPricingAlternate,
	#superclass : #F4SPriceComparison,
	#category : #'Falcon4Seaside-Widgets'
}

{ #category : #accessing }
F4SPricingAlternate >> renderContentOn: canvas [
    canvas div class: 'card mb-3'; with: [
        canvas div class: 'card-body'; with: [
            canvas div class: 'row justify-content-center'; with: [
                canvas div class: 'col-12 text-center mb-4'; with: [
                    canvas div class: 'fs-8'; with: 'Falcon Pricing'.
                    canvas heading level: 3; class: 'fs-7 fs-md-6'; with: [
                        canvas text: 'Free plan with all the basic features. '.
                        canvas break class: 'd-none d-md-block'.
                        canvas text: 'Pro plan for advanced users.'
                    ].
                    canvas div class: 'd-flex justify-content-center'; with: [
                        canvas label class: 'form-check-label me-2'; for: 'customSwitch1'; with: 'Monthly'.
                        canvas div class: 'form-check form-switch'; with: [
                            canvas input class: 'form-check-input falcon-dual-switch'; id: 'customSwitch1'; type: 'checkbox'.
                            canvas label class: 'form-check-label align-top'; for: 'customSwitch1'; with: 'Yearly'
                        ]
                    ]
                ].
                canvas div class: 'col-12 col-lg-9 col-xl-10 col-xxl-8'; with: [
                    canvas div class: 'row'; with: [
                        canvas div class: 'col-md'; with: [
                            canvas div class: 'border rounded-3 overflow-hidden mb-3 mb-md-0'; with: [
                                canvas div class: 'd-flex flex-between-center p-4'; with: [
                                    canvas div with: [
                                        canvas heading level: 3; class: 'fw-light fs-4 mb-0 text-primary'; with: 'Free'.
                                        canvas heading level: 2; class: 'fw-light mt-0 text-primary'; with: [
                                            canvas superscript class: 'fs-8'; with: '&dollar;'.
                                            canvas span class: 'fs-6'; with: '0'.
                                            canvas span class: 'fs-11 mt-1'; with: '/ m'
                                        ]
                                    ].
                                    canvas div class: 'pe-3'; with: [
                                        canvas image url: '../../assets/img/icons/free.svg'; width: 70; alt: ''
                                    ]
                                ].
                                canvas div class: 'p-4 bg-body-tertiary'; with: [
                                    canvas unorderedList class: 'list-unstyled'; with: [
                                        canvas listItem class: 'border-bottom py-2'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Unlimited Broadcasts'
                                        ].
                                        canvas listItem class: 'border-bottom py-2'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Unlimited Sequences'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Advanced marketing'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Api & Developer Tools'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom text-300'; with: [
                                            canvas span class: 'fas fa-check'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Integrations'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom text-300'; with: [
                                            canvas span class: 'fas fa-check'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Payments'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom text-300'; with: [
                                            canvas span class: 'fas fa-check'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Payments'
                                        ].
                                        canvas listItem class: 'py-2 text-300'; with: [
                                            canvas span class: 'fas fa-check'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Unlimted Tags'
                                        ]
                                    ].
                                    canvas button class: 'btn btn-outline-primary d-block w-100'; type: 'button'; with: 'Start free trial'
                                ]
                            ]
                        ].
                        canvas div class: 'col-md'; with: [
                            canvas div class: 'border rounded-3 overflow-hidden'; with: [
                                canvas div class: 'd-flex flex-between-center p-4'; with: [
                                    canvas div with: [
                                        canvas heading level: 3; class: 'fw-light text-primary fs-4 mb-0'; with: 'Pro'.
                                        canvas heading level: 2; class: 'fw-light text-primary mt-0'; with: [
                                            canvas superscript class: 'fs-8'; with: '&dollar;'.
                                            canvas span class: 'fs-6'; with: '99'.
                                            canvas span class: 'fs-11 mt-1'; with: '/ m'
                                        ]
                                    ].
                                    canvas div class: 'pe-3'; with: [
                                        canvas image url: '../../assets/img/icons/pro.svg'; width: 70; alt: ''
                                    ]
                                ].
                                canvas div class: 'p-4 bg-body-tertiary'; with: [
                                    canvas unorderedList class: 'list-unstyled'; with: [
                                        canvas listItem class: 'border-bottom py-2'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Unlimited Broadcasts'
                                        ].
                                        canvas listItem class: 'border-bottom py-2'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Unlimited Sequences'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Advanced marketing'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Api & Developer Tools'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Integrations'
                                        ].
                                        canvas listItem class: 'py-2 border-bottom'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Payments'
                                        ].
                                        canvas listItem class: 'py-2'; with: [
                                            canvas span class: 'fas fa-check text-primary'; attributeAt: 'data-fa-transform' put: 'shrink-2'.
                                            canvas text: ' Custom Fields'
                                        ]
                                    ].
                                    canvas button class: 'btn btn-primary d-block w-100'; type: 'button'; with: 'Purchase Now'
                                ]
                            ]
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
