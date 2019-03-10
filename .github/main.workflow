workflow "Test Workflow" {
  on = "push"
  resolves = ["Test"]
}

action "Build" {
  uses = "buildkite/docker-puppeteer@v1.13.0"
  runs = "npm"
  args = "install"
}

action "Test" {
  uses = "buildkite/docker-puppeteer@v1.13.0"
  needs = ["Build"]
  runs = "npm"
  args = "test"
  secrets = ["PERCY_TOKEN"]
}
