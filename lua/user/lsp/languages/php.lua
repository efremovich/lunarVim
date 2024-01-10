local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { "/home/efremov/Dev/web/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9000,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
}
