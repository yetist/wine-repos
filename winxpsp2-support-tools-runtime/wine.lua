pkgname = "winxpsp2-support-tools-runtimes"
pkgver = "2010"
pkgrel = 1
pkgdesc = "winxpsp2 support tools runtimes"

source = {
    'https://web.archive.org/web/20070104163903/https://download.microsoft.com/download/d/3/8/d38066aa-4e37-4ae8-bce3-a4ce662b2024/WindowsXP-KB838079-SupportTools-ENU.exe'
}

function install()
	return nil
end

function check()
	return wb.exists("WindowsXP-KB936929-SP3-x86-ENU.exe")
end
