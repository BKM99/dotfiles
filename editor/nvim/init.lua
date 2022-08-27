local status_ok_impatient, impatient = pcall(require, "impatient")
if status_ok_impatient then
	impatient.enable_profile()
end

require("config.default")
require("config.plugins")
