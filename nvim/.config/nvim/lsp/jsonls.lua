local schemastore_ok, schemastore = pcall(require, "schemastore")

return {
	settings = {
		json = {
			validate = { enable = true },
			schemas = schemastore_ok and schemastore.json.schemas() or {},
		},
	},
}
