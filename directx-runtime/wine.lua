pkgname = "directx-runtime"
pkgver = "2010"
pkgrel = 1
pkgdesc = "directx runtime"

source = {
  -- February 2010 DirectX 9c User Redistributable
  -- https://www.microsoft.com/en-us/download/details.aspx?id=9033
  -- 2021/01/28: https://download.microsoft.com/download/E/E/1/EE17FF74-6C45-4575-9CF4-7FC2597ACD18/directx_feb2010_redist.exe
  "https://files.holarse-linuxgaming.de/mirrors/microsoft/directx_feb2010_redist.exe",
  -- June 2010 DirectX 9c User Redistributable
  -- https://www.microsoft.com/en-us/download/details.aspx?id=8109
  -- 2021/01/28: https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe
  "https://files.holarse-linuxgaming.de/mirrors/microsoft/directx_Jun2010_redist.exe",
}

function install()
  return nil
end

function check()
  return wb.exists(wb.exists(source[1])) and wb.exists(wb.exists(source[2]))
end
