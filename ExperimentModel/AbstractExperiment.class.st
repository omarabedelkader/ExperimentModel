Class {
	#name : 'AbstractExperiment',
	#superclass : 'Object',
	#instVars : [
		'projectName',
		'instrumenter'
	],
	#category : 'ExperimentModel',
	#package : 'ExperimentModel'
}

{ #category : 'instance creation' }
AbstractExperiment class >> instrumenter: anExperimentInstrumenter [

	^ self new intrumenter: anExperimentInstrumenter 
]

{ #category : 'configuration' }
AbstractExperiment >> configureExperiment [

	EpMonitor disableDuring: [ 
		| concreteLogger |
		
		self flag: 'instantiate your logger'.
		concreteLogger := self newLogger.
		
		concreteLogger setExperiment: self.
		
		self flag: 'set the project name (will be the path on server)'.
		concreteLogger projectName: projectName.
		
		self flag: 'configure the logger'.
	"	concreteLogger participantUUID: instrumenter uuid."
		"instrumenter logger: concreteLogger."
		
		self flag: 'configure the instrumentation'.
		"instrumenter instrumentSystem."

		concreteLogger authorizeDataSending.
		 ]
]

{ #category : 'accessing' }
AbstractExperiment >> experienceId [ 
	^'complishon'
]

{ #category : 'accessing' }
AbstractExperiment >> instrumenterClass [
	^(self class environment at: #DSSpyInstrumenter)
]

{ #category : 'accessing' }
AbstractExperiment >> intrumenter: aTExperimentInstrumenter [
	
	instrumenter := aTExperimentInstrumenter 
]

{ #category : 'configuration' }
AbstractExperiment >> newLogger [
	^(self class environment at: #EMEventRecorderLogger) new
]

{ #category : 'configuration' }
AbstractExperiment >> removeERRecorderFromSettings [
	(self class environment at: #EREventRecorderSettings ifAbsent: [ ^ self ])
		class
		removeSelector: #urlSettingsOn:
		ifAbsent: [ ]
	
]

{ #category : 'requests' }
AbstractExperiment >> requestUserName [

	| input |
	input := UIManager default
		         request: 'Please provide your XTDD unique id:'
		         initialAnswer: ''.
	(#( nil '' ) includes: input) ifTrue: [ ^ self ].

	^ input
]

{ #category : 'accessing' }
AbstractExperiment >> spyClass [
	^(self class environment at: #DSSpy)
]
