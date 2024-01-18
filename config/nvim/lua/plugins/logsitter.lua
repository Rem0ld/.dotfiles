return {
  "gaelph/logsitter.nvim",
  config = function()
    local log = require("logsitter")
    local js = require("logsitter.lang.javascript")

    log.register(js, { "vue" })
  end,
}
