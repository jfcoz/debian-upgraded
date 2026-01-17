variable "REGISTRY" {
  default = "jfcoz"
}

function "tag" {
  params = [version]
  result = [
    "${REGISTRY}/debian-upgraded:${version}",
  ]
}

target "default" {
  context = "."
  name = "debian-upgraded-${replace(version, ".", "-")}"
  dockerfile = "Dockerfile"
  tags = tag(version)
  matrix = {
    version = [
      "12",
      "12-slim",
      "11",
      "11-slim",
      "10",
      "10-slim",
    ]
  }
  args = {
    DEBIAN_VERSION = version
  }
  platforms = ["linux/amd64", "linux/arm64"]
}
