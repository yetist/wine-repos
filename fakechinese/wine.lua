pkgname = "fakechinese"
pkgver = "2019"
pkgrel = 1
pkgdesc = "Creates aliases for Chinese fonts using Source Han Sans fonts"
publisher = "Adobe"
depends = { "source-han-sans-fonts" }

function install()
	wb.regset("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\FontLink\\SystemLink", {
		["Arial Black"] = "sourcehansans.ttc",
		["Arial"] = "sourcehansans.ttc",
		["Lucida Sans Unicode"] = "sourcehansans.ttc",
		["MS Sans Serif"] = "sourcehansans.ttc",
		["Microsoft Sans Serif"] = "sourcehansans.ttc",
		["SimSun"] = "sourcehansans.ttc",
		["Tahoma Bold"] = "sourcehansans.ttc",
		["Tahoma"] = "sourcehansans.ttc",
	})
end

function check()
	local _, val = wb.regvalue(
		"HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\FontLink\\SystemLink",
		"Arial"
	)
	if val == "sourcehansans.ttc" then
		return true
	end
	return false
end
