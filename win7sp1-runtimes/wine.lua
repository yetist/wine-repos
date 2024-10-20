pkgname = "win7sp1-runtimes"
pkgver = "2011"
pkgrel = 1
pkgdesc = "win7sp1 runtimes"

--[[ Formerly at:
  https://www.microsoft.com/en-us/download/details.aspx?id=5842
  2020/08/27: https://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X86.exe
  2020/08/27: https://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X64.exe
]]
--

source = {
	"http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe",
	"http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe",
}

function install()
	os.rename(wb.basename(source[1], "windows6.1-KB976932-X86.exe"))
	os.rename(wb.basename(source[2], "windows6.1-KB976932-X64.exe"))
end

function check()
	return wb.exists("windows6.1-KB976932-X86.exe") and wb.exists("windows6.1-KB976932-X64.exe")
end
