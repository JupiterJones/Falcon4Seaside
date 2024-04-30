Class {
	#name : #F4SFileLibrary,
	#superclass : #WAFileMetadataLibrary,
	#category : #'Falcon4Seaside-FileLibrary'
}

{ #category : #loading }
F4SFileLibrary class >> loadFromDist [
  "Load the dist directory into the F4SFileLibrary"

  (self allSelectors
    select: [ :selector | 
      #(#'uploaded' #'uploaded metadata')
        includes: (self categoryOfSelector: selector) ])
    do: [ :selector | self removeSelector: selector ].
  self removeEmptyCategories.
  self
    recursivelyAddAllFilesIn: '/opt/git/JupiterSmalltalk/AdminLTE/dist'
]
