Class {
	#name : 'BaselineOfExperimentModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfExperimentModel',
	#package : 'BaselineOfExperimentModel'
}

{ #category : 'baselines' }
BaselineOfExperimentModel >> baseline: spec [

	<baseline>
	spec baseline: 'PharoXPEventRecorder' with: [
		spec repository:
			'github://Pharo-XP-Tools/Pharo-XP-EventRecorder:omar/' ].

	spec for: #common do: [ 
		spec postLoadDoIt: #postLoad.
		spec
			package: 'ExperimentModel'
			with: [ spec requires: #( 'PharoXPEventRecorder' ) ] ]
]

{ #category : 'baselines' }
BaselineOfExperimentModel >> postLoad [
	WorkingSession compile: 'id ^UUID new printString'.
	WorkingSession compile: 'creationTime ^DateAndTime now'.
]
