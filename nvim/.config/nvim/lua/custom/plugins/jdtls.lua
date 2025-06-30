local function get_config_dir()
	if vim.fn.has("linux") == 1 then
		return "config_linux"
	elseif vim.fn.has("mac") == 1 then
		return "config_mac"
	else
		return "config_win"
	end
end

return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	config = function()
		local jdtls = require("jdtls")

		local mason_path = vim.fn.stdpath("data") .. "/mason"
		local jdtls_path = mason_path .. "/packages/jdtls"
		local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

		local config_dir = jdtls_path .. "/" .. get_config_dir()

		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

		local root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" })
		if not root_dir then
			root_dir = vim.fn.getcwd()
		end

		local config = {
			cmd = {
				"java", -- this must point to Java 21 or newer
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				launcher_jar,
				"-configuration",
				config_dir,
				"-data",
				workspace_dir,
			},
			root_dir = root_dir,
			settings = {
				java = {},
				configuration = {
					runtimes = {
						-- NOTE: add more java runtimes here
						-- {
						-- 	name = "JavaSE-11",
						-- 	path = home .. "/.sdkman/candidates/java/11.0.10-open/",
						-- },
					},
				},
			},
			init_options = {
				bundles = {},
			},
			-- on_attach = function(client, bufnr) end,
		}

		jdtls.start_or_attach(config)
	end,
}
