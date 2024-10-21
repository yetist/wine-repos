pkgname = "riched20"
pkgver = "2004"
pkgrel = 1
pkgdesc = "MS RichEdit Control 2.0 (riched20.dll)"
publisher = "Microsoft"

depends = { "win2ksp4-runtime" }
source = { "override-dll.reg" }

-- install pkg into wine prefix
function install()
  print("install (".. pkgname ..")")
  os.execute("cabextract -L -F i386/riched20.dl_ " .. wb.var.cache_dir .. "/W2KSP4_EN.EXE")
  os.execute("cabextract --directory=" .. wb.var.system32_dlls .. " i386/riched20.dl_")

  -- # https://github.com/Winetricks/winetricks/issues/292
  wb.wine("regedit override-dll.reg")
end

-- is this pkg installed?
function check()
  print("check(".. pkgname ..")")
  ret, text = wb.wine('reg QUERY "HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides" /v msls31')
  if ret ~= 0 then
    return false
  end
  if string.find(wb.strip(text), "native,builtin") ~= nil then
    return true
  end
  return false
end
