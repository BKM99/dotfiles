local status_ok_impatient, _ = pcall(require, "impatient")
if not status_ok_impatient then
    print("impatient not loaded!")
end

require("config.default")
require("config.plugins")
