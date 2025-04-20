local schemastore_ok, schemastore = pcall(require, "schemastore")

return {
	settings = {
		yaml = {
			schemastore = { enable = false, url = "" },
			schemas = schemastore_ok and schemastore.yaml.schemas() or {},
		},
	},
}
