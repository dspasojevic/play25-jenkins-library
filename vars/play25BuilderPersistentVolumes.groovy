def call(Map config) {
  return [
    [path: '/home/jenkins/.ivy2', sizeGiB: 2],
    [path: '/home/jenkins/.sbt',  sizeGiB: 2]
  ].collect { volume -> [
      *: volume,
      name: "${config.project}-${volume.path.replaceAll(/[^a-zA-Z0-9]+/, '-')}"
  ]}
}