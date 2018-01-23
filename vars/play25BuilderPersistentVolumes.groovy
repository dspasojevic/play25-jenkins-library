def call(Map config) {
  return [
    [
      path: '/home/jenkins/.ivy2',
      name: "${config.project}-home-jenkins-ivy2",
      sizeGiB: 2
    ],
    [
      path: '/home/jenkins/.sbt',
      name: "${config.project}-home-jenkins-sbt",
      sizeGiB: 2
    ]
  ]
}