Class {
	#name : #F4SRootComponent,
	#superclass : #F4SCompositeComponent,
	#instVars : [
		'navigation'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #installing }
F4SRootComponent class >> applicationName [
	^ self subclassResponsibility
]

{ #category : #testing }
F4SRootComponent class >> canBeRoot [
	^ true
]

{ #category : #installing }
F4SRootComponent class >> configureApplication: anApplication [
	anApplication preferenceAt: #sessionClass put: F4SSession.
	anApplication configuration addParent: WAGetTextConfiguration instance.
	anApplication configuration addParent: F4SSystemConfiguration instance.
	anApplication addLibrary: self fileLibraryClass.
	anApplication preferenceAt: #gettextApplicationName put: self applicationName.
	anApplication
		preferenceAt: #pathToRepository
		put: '/opt/git/JupiterJones/Falcon4Seaside'
]

{ #category : #accessing }
F4SRootComponent class >> fileLibraryClass [
	^ F4SFileLibrary
]

{ #category : #installing }
F4SRootComponent class >> register [
	self configureApplication: (WAAdmin register: self asApplicationAt: self applicationName)
]

{ #category : #installing }
F4SRootComponent class >> reregister [
	self
		unregister;
		register
]

{ #category : #installing }
F4SRootComponent class >> unregister [
	WAAdmin unregister: self applicationName
]

{ #category : #actions }
F4SRootComponent >> addNavItem: aNavItem [
	navigation add: aNavItem
]

{ #category : #accessing }
F4SRootComponent >> applicationName [
	^ self class applicationName
]

{ #category : #accessing }
F4SRootComponent >> brandImageUrl [
	^ self fileLibraryClass / #imagesfaviconappletouchiconPng
]

{ #category : #accessing }
F4SRootComponent >> brandLabel [
	^ self applicationName
]

{ #category : #accessing }
F4SRootComponent >> configJs [
	| stream |
	stream := JSStream new.
	stream
		nextPutAll: '"use strict";

/* -------------------------------------------------------------------------- */
/*                              Config                                        */
/* -------------------------------------------------------------------------- */
var CONFIG = { '.

	stream
		nextPutAll: 'isNavbarVerticalCollapsed: ';
		nextPutAll: (self application configuration at: #isNavbarVerticalCollapsed) asString;
		nextPutAll: ', '.
	stream
		nextPutAll: 'theme: "';
		nextPutAll: (self application configuration at: #theme);
		nextPutAll: '", '.
	stream
		nextPutAll: 'isRTL: ';
		nextPutAll: (self application configuration at: #isRTL) asString;
		nextPutAll: ', '.
	stream
		nextPutAll: 'isFluid: ';
		nextPutAll: (self application configuration at: #isFluid) asString;
		nextPutAll: ', '.
	stream
		nextPutAll: 'navbarStyle: "';
		nextPutAll: (self application configuration at: #navbarStyle);
		nextPutAll: '", '.
	stream
		nextPutAll: 'navbarPosition: "';
		nextPutAll: (self application configuration at: #navbarPosition);
		nextPutAll: '"'.


	stream
		nextPutAll: '}; 
Object.keys(CONFIG).forEach(function (key) {
  if (localStorage.getItem(key) === null) {
    localStorage.setItem(key, CONFIG[key]);
  }
});
if (JSON.parse(localStorage.getItem("isNavbarVerticalCollapsed"))) {
  document.documentElement.classList.add("navbar-vertical-collapsed");
}
if (localStorage.getItem("theme") === "dark") {
  document.documentElement.setAttribute("data-bs-theme", "dark");
} else if (localStorage.getItem("theme") === "auto") {
  document.documentElement.setAttribute("data-bs-theme", window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
}'.
^ stream
]

{ #category : #accessing }
F4SRootComponent >> containerClass [
	"Answers 'container' or 'container-fluid'"

	^ String
		streamContents: [ :stream | 
			stream nextPutAll: 'container'.
			(self application configuration at: #isFluid)
				ifTrue: [ stream nextPutAll: '-fluid' ] ]
]

{ #category : #accessing }
F4SRootComponent >> currentLanguage [
	^ 'en-US'
]

{ #category : #accessing }
F4SRootComponent >> currentTheme [
	^ 'light'
]

{ #category : #accessing }
F4SRootComponent >> fileLibraryClass [
	^ self class fileLibraryClass
]

{ #category : #initialization }
F4SRootComponent >> initialize [
	super initialize.
	self initializeNavigation
]

{ #category : #initialization }
F4SRootComponent >> initializeNavigation [
	navigation := OrderedCollection new
]

{ #category : #'testing-navigation' }
F4SRootComponent >> isNavbarCard [
	^ (self application preferenceAt: #navbarStyle) = 'card'
]

{ #category : #'testing-navigation' }
F4SRootComponent >> isNavbarDoubleTop [
	^ (self application preferenceAt: #navbarPosition) = 'double-top'
]

{ #category : #'testing-navigation' }
F4SRootComponent >> isNavbarInverted [
	^ (self application preferenceAt: #navbarStyle) = 'inverted'
]

{ #category : #'testing-navigation' }
F4SRootComponent >> isNavbarTop [
	^ self isNavbarVertical not
]

{ #category : #'testing-navigation' }
F4SRootComponent >> isNavbarVertical [
	^ (self application preferenceAt: #navbarPosition) = 'vertical'
]

{ #category : #'testing-navigation' }
F4SRootComponent >> isNavbarVibrant [
	^ (self application preferenceAt: #navbarStyle) = 'vibrant'
]

{ #category : #accessing }
F4SRootComponent >> leftToRightOrRightToLeft [
	"Answer ltr to rtl"
	^ 'ltr'
]

{ #category : #rendering }
F4SRootComponent >> renderContentOn: canvas [
	canvas main
		class: 'main';
		id: 'top';
		with: [ canvas div
				class: self containerClass;
				attributeAt: 'data-layout' put: self containerClass;
				with: [ canvas script
						with: 'var isFluid = JSON.parse(localStorage.getItem("isFluid"));
          if (isFluid) {
            var container = document.querySelector("[data-layout]");
            container.classList.remove("container");
            container.classList.add("container-fluid");
          }'.

					self renderNavigationOn: canvas ] ]
]

{ #category : #'rendering-navigation' }
F4SRootComponent >> renderNavigationBrandOn: canvas [
	canvas anchor
		class: 'navbar-brand';
		class: 'me-1 me-sm-3' if: self isNavbarTop;
		with: [ canvas div
				class: 'd-flex align-items-center';
				class: 'py-3' if: self isNavbarVertical;
				with: [ canvas image
						class: 'me-2';
						url: self brandImageUrl;
						width: 40.
					canvas span
						class: 'font-sans-serif text-primary';
						with: [ self brandLabel ] ] ]
]

{ #category : #'rendering-navigation' }
F4SRootComponent >> renderNavigationDoubleTopOn: canvas [
	canvas navigation
		class: 'navbar navbar-light';
		class: 'navbar-glass navbar-top navbar-expand-lg';
		with: [ canvas div
				class: 'w-100';
				with: [ canvas
						class: 'd-flex flex-between-center';
						with: [ self renderNavigationTopToggleOn: canvas.
							self renderNavigationBrandOn: canvas ] ] ]
]

{ #category : #'rendering-navigation' }
F4SRootComponent >> renderNavigationOn: canvas [
	self isNavbarVertical
		ifTrue: [ self renderNavigationVerticalOn: canvas ]
		ifFalse: [ self isNavbarDoubleTop
				ifTrue: [ self renderNavigationDoubleTopOn: canvas ]
				ifFalse: [ self renderNavigationTopOn: canvas ] ]
]

{ #category : #'rendering-navigation' }
F4SRootComponent >> renderNavigationTopOn: canvas [
	canvas navigation
		class: 'navbar navbar-light';
		class: 'navbar-glass navbar-top navbar-expand-lg';
		with: [ self renderNavigationTopToggleOn: canvas.
			self renderNavigationBrandOn: canvas ]
]

{ #category : #'rendering-navigation' }
F4SRootComponent >> renderNavigationTopToggleOn: canvas [
    canvas button
        class: 'btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3';
        type: 'button';
        attributeAt: 'data-bs-toggle' put: 'collapse';
        attributeAt: 'data-bs-target' put: '#navbarStandard';
        attributeAt: 'aria-controls' put: 'navbarStandard';
        attributeAt: 'aria-expanded' put: 'false';
        attributeAt: 'aria-label' put: 'Toggle Navigation';
        with: [
            canvas span
                class: 'navbar-toggle-icon';
                with: [
                    canvas span
                        class: 'toggle-line']]

]

{ #category : #'rendering-navigation' }
F4SRootComponent >> renderNavigationVerticalOn: canvas [
	canvas navigation
		class: 'navbar navbar-light';
		class: 'navbar-vertical navbar-expand-xl';
		class: 'navbar-card' if: self isNavbarCard;
		class: 'navbar-inverted' if: self isNavbarInverted;
		class: 'navbar-vibrant' if: self isNavbarVibrant;
		with: [ canvas script
				with: 'var navbarStyle = localStorage.getItem("navbarStyle");
	if (navbarStyle && navbarStyle !== "transparent") {
		document.querySelector(".navbar-vertical").classList.add("navbar-${navbarStyle}");
	}'.
			canvas div
				class: 'd-flex align-items-center';
				with: [ canvas div
						class: 'toggle-icon-wrapper';
						with: [ self renderNavigationVerticalToggleOn: canvas ].
					self renderNavigationBrandOn: canvas ].
			canvas div
				class: 'collapse navbar-collapse';
				id: 'navbarVerticalCollapse';
				with: [ canvas div
						class: 'navbar-vertical-content scrollbar';
						with: [ canvas unorderedList
								class: 'navbar-nav flex-column mb-3';
								id: 'navbarVerticalNav';
								with: [ "render navigation items" ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SRootComponent >> renderNavigationVerticalToggleOn: canvas [
	canvas button
		class: 'btn navbar-toggler-humburger-icon navbar-vertical-toggle';
		attributeAt: 'data-bs-toggle' put: 'tooltip';
		attributeAt: 'data-bs-placement' put: 'left';
		attributeAt: 'title' put: 'Toggle Navigation';
		with: [ canvas span
				class: 'navbar-toggle-icon';
				with: [ canvas span class: 'toggle-line' ] ]
]

{ #category : #updating }
F4SRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot htmlAttributes
		at: 'lang' append: self currentLanguage;
		at: 'data-bs-theme' append: self currentTheme;
		at: 'dir' append: self leftToRightOrRightToLeft.

	anHtmlRoot beHtml5.
	anHtmlRoot meta
		attributeAt: 'http-equiv' put: 'X-UA-Compatible';
		content: 'IE=edge'.
	anHtmlRoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot title: self windowTitle seasideTranslated asUTF8Bytes.
	self updateRootFavIcon: anHtmlRoot.
	self updateRootTheme: anHtmlRoot.
	self updateRootScripts: anHtmlRoot.
	self updateRootStyles: anHtmlRoot
]

{ #category : #updating }
F4SRootComponent >> updateRootFavIcon: anHtmlRoot [
	"Add links for all the favicon options"
	
	"Adding apple-touch-icon"
	anHtmlRoot link
		relationship: 'apple-touch-icon';
		attributeAt: 'sizes' put: '180x180';
		url: self fileLibraryClass / #'imagesfaviconappletouchiconPng'.	
	
	"Adding favicon for 32x32"
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		attributeAt: 'sizes' put: '32x32';
		url: self fileLibraryClass / #'imagesfaviconfavicon32x32Png'.
	
	"Adding favicon for 16x16"
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		attributeAt: 'sizes' put: '16x16';
		url: self fileLibraryClass / #'imagesfaviconfavicon16x16Png'.
	
	"Adding web application manifest"
	anHtmlRoot link
		relationship: 'manifest';
		url: self fileLibraryClass / #'imagesfaviconsiteWebmanifest'.	
	
	"Adding Safari mask icon"
	anHtmlRoot link
		relationship: 'mask-icon';
		url: self fileLibraryClass / #'imagesfaviconsafaripinnedtabSvg';
		attributeAt: 'color' put: '#5bbad5'.
	
	"Adding shortcut icon"
	anHtmlRoot link
		relationship: 'shortcut icon';
		url: self fileLibraryClass / #'imagesfaviconfaviconIco'.
	
	"Adding meta tags for application titles and configuration"
	anHtmlRoot meta
		name: 'apple-mobile-web-app-title';
		content: self windowTitle.
	anHtmlRoot meta
		name: 'application-name';
		content: self windowTitle.
	anHtmlRoot meta
		name: 'msapplication-TileColor';
		content: '#2b5797'.
	anHtmlRoot meta
		name: 'msapplication-config';
		content: self fileLibraryClass / #'imagesfaviconbrowserconfigXml'.
]

{ #category : #updating }
F4SRootComponent >> updateRootScripts: anHtmlRoot [ 
	"Add scripts that will be loaded on every page"
	
	"Adding external JavaScript file for SimpleBar"
    anHtmlRoot script
        url: self fileLibraryClass / #'vendorssimplebarsimplebarminJs'.
]

{ #category : #updating }
F4SRootComponent >> updateRootStyles: anHtmlRoot [ 
	"Add stylesheets"

    "Preconnect to fonts.gstatic.com"
    anHtmlRoot link
        relationship: 'preconnect';
        url: 'https://fonts.gstatic.com'.

    "Adding Google Fonts stylesheet for Open Sans and Poppins"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: 'https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&display=swap'.
       
    "Adding SimpleBar CSS"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'vendorssimplebarsimplebarminCss'.

    "Adding right-to-left theme stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssthemertlCss';
        attributeAt: 'id' put: 'style-rtl'.

    "Adding default theme stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssthemeCss';
        attributeAt: 'id' put: 'style-default'.

    "Adding user-specific right-to-left stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssuserrtlCss';
        attributeAt: 'id' put: 'user-style-rtl'.

    "Adding user-specific default stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssuserCss';
        attributeAt: 'id' put: 'user-style-default'.

	 anHtmlRoot script with: '
        var isRTL = JSON.parse(localStorage.getItem("isRTL"));
        if (isRTL) {
            var linkDefault = document.getElementById("style-default");
            var userLinkDefault = document.getElementById("user-style-default");
            linkDefault.setAttribute("disabled", true);
            userLinkDefault.setAttribute("disabled", true);
            document.querySelector("html").setAttribute("dir", "rtl");
        } else {
            var linkRTL = document.getElementById("style-rtl");
            var userLinkRTL = document.getElementById("user-style-rtl");
            linkRTL.setAttribute("disabled", true);
            userLinkRTL.setAttribute("disabled", true);
        }'.
]

{ #category : #updating }
F4SRootComponent >> updateRootTheme: anHtmlRoot [
	"Add links for the theme"
	
	"Setting theme color"
    anHtmlRoot meta
        name: 'theme-color';
        content: '#ffffff'.

    "Adding theme config JavaScript"
    anHtmlRoot script with: self configJs
]

{ #category : #accessing }
F4SRootComponent >> windowTitle [
	^ self subclassResponsibility
]
