local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.expand("$HOME/.local/share/nvim/jdtls/" .. project_name)

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

vim.notify("java")

local extendedClientCapabilities = jdtls.extendedClientCapabilities

-- vim.g.set_java_home("17")

local config = {
	cmd = {
		"jdtls",

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx2g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		vim.fn.expand("--jvm-arg=-javaagent:$HOME/dotfiles/nvim/lombok.jar"),

		"-configuration",
		vim.fn.expand("$HOME/jdtls/config_linux/"),

		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},

	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			extendedClientCapabilities = extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
			format = {
				enabled = false,
			},
		},
	},
}
require("jdtls").start_or_attach(config)
