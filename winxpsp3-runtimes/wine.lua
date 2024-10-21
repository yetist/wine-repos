pkgname = "winxpsp3-runtimes"
pkgver = "2010"
pkgrel = 1
pkgdesc = "winxpsp3 runtimes"

-- Formerly at:
-- https://www.microsoft.com/en-us/download/details.aspx?id=24
-- https://download.microsoft.com/download/d/3/0/d30e32d8-418a-469d-b600-f32ce3edf42d/WindowsXP-KB936929-SP3-x86-ENU.exe
-- Mirror list: http://www.filewatcher.com/m/WindowsXP-KB936929-SP3-x86-ENU.exe.331805736-0.html
-- 2018/04/04: http://www.download.windowsupdate.com/msdownload/update/software/dflt/2008/04/windowsxp-kb936929-sp3-x86-enu_c81472f7eeea2eca421e116cd4c03e2300ebfde4.exe
-- 2020/12/09: https://ftp.gnome.org/mirror/archive/ftp.sunet.se/pub/security/vendor/microsoft/winxp/Service_Packs/WindowsXP-KB936929-SP3-x86-ENU.exe

source = {
	"WindowsXP-KB936929-SP3-x86-ENU.exe::http://www.download.windowsupdate.com/msdownload/update/software/dflt/2008/04/windowsxp-kb936929-sp3-x86-enu_c81472f7eeea2eca421e116cd4c03e2300ebfde4.exe",
}

function install()
    return nil
end

function check()
	return wb.exists("WindowsXP-KB936929-SP3-x86-ENU.exe")
end
