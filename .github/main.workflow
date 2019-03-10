workflow "Test Workflow" {
  on = "push"
  resolves = ["Test"]
}

action "Build" {
  uses = "ianwalter/puppeteer@v1.0.0"
  runs = "npm"
  args = "install"
}

action "Test" {
  uses = "ianwalter/puppeteer@v1.0.0"
  needs = ["Build"]
  runs = "npm"
  args = "test"
  secrets = ["PERCY_TOKEN"]
}
