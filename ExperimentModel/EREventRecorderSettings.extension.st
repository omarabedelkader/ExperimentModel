Extension { #name : 'EREventRecorderSettings' }

{ #category : '*ExperimentModel' }
EREventRecorderSettings class >> urlSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder setting: #stringUrl)
		parent: #tools;
		target: self;
		description: 'The default URL for the Event Recorder server.';
		label: 'Event Recorder URL address'
]
