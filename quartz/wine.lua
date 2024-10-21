pkgname   = 'quartz'
pkgver    = '2016'
pkgrel    = 1
pkgdesc   = 'quartz.dll'
publisher = 'Microsoft'

url = 'https://www.51dzt.com/rubik-ssr/51dzt'

depends = {'win7sp1'}
source = {'override.reg'}

-- install pkg into wine prefix
function install()
    print('install quartz')
    print('wine_arch=' .. wb.var.arch)

--  os.execute('cabextract -L -F i386/riched20.dl_ '.. wb.var.cache_dir ..'/W2KSP4_EN.EXE')
--  os.execute('cabextract --directory='.. wb.var.system32_dlls ..' i386/riched20.dl_')
  wb.wine("regedit override.reg")

---[[
    w_try_cabextract -d "${W_TMP}" -L -F "${filename}" "${W_CACHE}"/win7sp1/windows6.1-KB976932-X86.exe

    helper_win7sp1 x86_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_a877a1cc4c284497/quartz.dll
    w_try_cp_dll "${W_TMP}/x86_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_a877a1cc4c284497/quartz.dll" "${W_SYSTEM32_DLLS}/quartz.dll"
    w_override_dlls native,builtin quartz
    w_try_regsvr quartz.dll

    if [ "${W_ARCH}" = "win64" ]; then
        helper_win7sp1_x64 amd64_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_04963d500485b5cd/quartz.dll
        w_try_cp_dll "${W_TMP}/amd64_microsoft-windows-directshow-core_31bf3856ad364e35_6.1.7601.17514_none_04963d500485b5cd/quartz.dll" "${W_SYSTEM64_DLLS}/quartz.dll"
        w_try_regsvr64 quartz.dll
    fi
]]---

end

-- is this pkg installed?
function check()
  ret, text = wb.wine("reg QUERY \"HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides\" /v msls31")
  if ret ~= 0 then
    return false
  end
  if (string.find(wb.strip(text), "native,builtin") ~= nil) then
    return true
  end
  return false
end
