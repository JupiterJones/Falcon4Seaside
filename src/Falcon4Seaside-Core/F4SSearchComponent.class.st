Class {
	#name : #F4SSearchComponent,
	#superclass : #F4SCompositeComponent,
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SSearchComponent >> renderContentOn: canvas [
	canvas div
		class: 'search-box';
		with: [ canvas form
				class: 'position-relative';
				attributeAt: 'data-bs-toggle' put: 'search';
				attributeAt: 'data-bs-display' put: 'static';
				with: [ canvas searchInput
						class: 'form-control search-input fuzzy-search';
						placeholder: 'Search…';
						attributeAt: 'aria-label' put: 'Search'.
					canvas span class: 'fas fa-search search-box-icon' ].
			canvas div
				class: 'btn-close-falcon-container position-absolute end-0 top-50 translate-middle shadow-none';
				attributeAt: 'data-bs-dismiss' put: 'search';
				with: [ canvas button
						bePush;
						class: 'btn btn-link btn-close-falcon p-0';
						attributeAt: 'aria-label' put: 'Close' ].
			self renderSearchResultsOn: canvas ]
]

{ #category : #accessing }
F4SSearchComponent >> renderSearchResultsByGroupOn: canvas [
	"TODO: Implement Search Filters"
	"Dummy: Recently Browsed Filter Example"

	canvas heading
		level6;
		class: 'dropdown-header fw-medium text-uppercase px-x1 fs-11 pt-0 pb-2';
		with: [ canvas text: 'Recently Browsed' seasideTranslated ].
	canvas anchor
		class: 'dropdown-item fs-10 px-x1 py-1 hover-primary';
		url: '#';
		with: [ canvas div
				class: 'd-flex align-items-center';
				with: [ canvas span class: 'fas fa-circle me-2 text-300 fs-11'.
					canvas div
						class: 'fw-normal title';
						with: [ canvas text: 'Pages'.
							canvas span
								class: 'fas fa-chevron-right mx-1 text-500 fs-11';
								attributeAt: 'data-fa-transform' put: 'shrink-2' ].
					canvas
						space;
						text: 'Events' ] ]
]

{ #category : #accessing }
F4SSearchComponent >> renderSearchResultsOn: canvas [
	canvas div  
		class: 'dropdown-menu border font-base start-0 mt-2 py-0 overflow-hidden w-100';
		with: [ canvas div
				class: 'scrollbar list py-3';
				style: 'max-height: 24rem;';
				with: [ self renderSearchResultsByGroupOn: canvas ].

			canvas div
				class: 'text-center mt-n3';
				with: [ canvas paragraph
						class: 'fallback fw-bold fs-8 d-none';
						with: [ canvas text: 'No Results Found' seasideTranslated ] ] ]
]
