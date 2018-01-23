def call() {
	return [
		containerTemplate(
			name: 'play25-builder',
			image: 'agiledigital/play25-builder',
	        alwaysPullImage: true,
			command: 'cat',
			ttyEnabled: true
		)
	]
}