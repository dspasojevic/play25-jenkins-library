def call() {
	return [
		containerTemplate(
			name: 'build-sbt-play25',
			image: 'agiledigital/build-image-sbt-play25',
	        alwaysPullImage: true,
			command: 'cat',
			ttyEnabled: true
		)
	]
}