local status_ok_impatient, impatient = pcall(require, "impatient")
if not status_ok_impatient then
	print("impatient not loaded!")
end

impatient.enable_profile()
